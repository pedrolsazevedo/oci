#!/bin/bash

show_help() {
    echo "Usage: ./oci.sh <command> [options]"
    echo ""
    echo "Commands:"
    echo "  build <distro|all>  - Build images locally"
    echo "  run <distro>        - Run container shell"
    echo ""
    echo "Available distros:"
    echo "  alpine, ubuntu, ubi, suse, node, oraclelinux, all"
    echo ""
    echo "Examples:"
    echo "  ./oci.sh build all"
    echo "  ./oci.sh build ubuntu"
    echo "  ./oci.sh run alpine"
    echo "  ./oci.sh run ubuntu -v \$(pwd):/workspace"
}

build_image() {
    local image=$1
    echo "Building $image image"
    docker build -t local/"$image":latest -f build/Dockerfile."$image" .
}

case $1 in
    build)
        case $2 in
            all)
                for image in alpine ubuntu ubi suse node oraclelinux; do
                    build_image $image
                done
                ;;
            alpine|ubuntu|ubi|suse|node|oraclelinux)
                build_image "$2"
                ;;
            *)
                echo "Error: Unknown distro '$2'"
                show_help
                exit 1
                ;;
        esac
        ;;
    run)
        if [ -z "$2" ]; then
            echo "Error: Distro required"
            show_help
            exit 1
        fi
        distro=$2
        shift 2
        case $distro in
            alpine|ubuntu|ubi|suse|node|oraclelinux)
                docker run -it --rm "$@" local/"$distro"
                ;;
            *)
                echo "Error: Unknown distro '$distro'"
                show_help
                exit 1
                ;;
        esac
        ;;
    -h|--help|"")
        show_help
        ;;
    *)
        echo "Error: Unknown command '$1'"
        show_help
        exit 1
        ;;
esac
