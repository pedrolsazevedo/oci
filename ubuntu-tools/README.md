# Ubuntu Tools Docker Script

This script checks if the `ubuntu-tools` Docker image is available locally, builds it if not, and runs a container. It also includes options to force rebuild the image and specify a custom container name.

## Usage

```sh
./run_ubuntu_tools.sh [-f] [-n container_name]
```

### Options

- `-f`: Force rebuild of the Docker image.
- `-n container_name`: Specify a custom container name (optional). The container name will also be used as the hostname.

### Examples

- Run the script with the default container name:

  ```sh
  ./run_ubuntu_tools.sh
  ```

- Force rebuild the Docker image and run the container with the default name:

  ```sh
  ./run_ubuntu_tools.sh -f
  ```

- Run the script with a custom container name:

  ```sh
  ./run_ubuntu_tools.sh -n custom-container
  ```

- Force rebuild the Docker image and run the container with a custom name:

  ```sh
  ./run_ubuntu_tools.sh -f -n custom-container
  ```

## Script Details

The script performs the following steps:

1. Parses the command-line arguments to check for the force build flag (`-f`) and an optional container name (`-n`).
2. Checks if the `ubuntu-tools` Docker image exists locally.
3. If the image does not exist or the force build flag is set, builds the Docker image.
4. Runs the Docker container with the specified or default name, mounting the current directory to `/data` in the container.

