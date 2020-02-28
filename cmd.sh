#!/bin/bash
# This is a helper script for performing common nebula operations

set -e

if [ ! -z $DEBUG ]; then set -x; fi

# cd to project's root
cd "$( dirname "${BASH_SOURCE[0]}" )"

function nebula {
    docker run \
        -it --rm \
        -v $(pwd)/config:/etc/nebula \
        -w /etc/nebula \
        mediocregopher/nebula nebula "$@"
}

function nebula_cert {
    docker run \
        -it --rm \
        -u $UID:$GID \
        -v $(pwd)/config:/etc/nebula \
        -w /etc/nebula \
        mediocregopher/nebula nebula-cert "$@"
}

function construct_env {
    # first compose the env files into the .env file. docker-compose only reads
    # the .env file when filling template variables in docker-compose.yml.
    # Luckily it will only honor the last variable to be defined in the case of
    # duplicates, so we can just append the user-defined configuration to the
    # default.
    cp env.default .env
    if [ -f env ]; then cat env >> .env; fi
}

NEBULA_CIDR=10.42.0.0/16

case "$1" in
    "new-ca")
        echo -n "Name of organization: "; read name
        nebula_cert ca -name "$name"
        ;;

    "new-host")
        echo -n "Owner of machine: "; read owner
        echo -n "Hostname of machine: "; read name
        echo -n "IP of host (must be in the $NEBULA_CIDR range): "; read ip
        if grep -q "$ip" nebula_hosts.txt; then
            echo "!!! The ip $ip is already being used !!!"; exit 1
        fi

        nebula_cert sign -name "$name" -ip "$ip/16"

        outer_tmp_dir="config/nebula_configs"
        mkdir -p "$outer_tmp_dir"
        echo '*' > "$outer_tmp_dir/.gitignore"

        tmp_dir="$outer_tmp_dir/$name"
        mkdir -p "$tmp_dir/config"
        mv "config/$name.crt" "$tmp_dir/config/host.crt"
        mv "config/$name.key" "$tmp_dir/config/host.key"
        cp "config/ipfs_cluster_secret.txt" "$tmp_dir/config/ipfs_cluster_secret.txt"

        (cd $tmp_dir && tar cvzf "../Cryptorado-Node-$name.tgz" *)
        rm -rf "$tmp_dir"
        echo "$outer_tmp_dir/Cryptorado-Node-$name.tgz has been created, please give it to $owner (but don't commit the file)"
        echo ""

        echo -e "$owner\t$name\t$ip/16" >> nebula_hosts.txt
        echo "$name has been added to nebula_hosts.txt, please commit and push this change"
        ;;

    "ls-peers")
        docker-compose exec ipfs-cluster ipfs-cluster-ctl peers ls
        ;;

    "ls-pins")
        docker-compose exec ipfs-cluster ipfs-cluster-ctl pin ls
        ;;

    "pin")
        if [ -z $2 ]; then
            echo "please give path to file/directory which should be pinned"
            exit 1
        elif [ ! -e "$2" ]; then
            echo "path $2 does not contain a file or directory"
            exit 1
        fi
        path="$2"
        dst_path=$(mktemp -d -p $(pwd)/ipfs_data/export)
        echo "copying $path into $dst_path"
        cp -r "$path" "$dst_path/"

        echo "pinning $path"
        inner_path="/export/$(basename $dst_path)/$(basename $path)"
        dt=$(date '+%Y/%m/%d %H:%M:%S %z')
        docker-compose exec ipfs-cluster \
            ipfs-cluster-ctl add --metadata "dt=$dt" "$inner_path"
        ;;

    "up")
        construct_env
        docker-compose up -d
        ;;

    "down")
        construct_env
        docker-compose down
        ;;

    "update")
        git pull
        ./cmd.sh down
        ./cmd.sh up
        ;;

    *)
        # TODO we should probably use a real command-line parsing framework
        echo "Usage: cmd.sh <new-ca|new-host|ls-peers|ls-pins|pin|up|down|update>"
        exit 1
esac
