#!/bin/bash

# Function to detect the package manager
detect_package_manager() {
  # Check if apt package manager is being used
  if [ -x "$(command -v apt)" ]; then
    echo "apt"
  # Check if yum package manager is being used
  elif [ -x "$(command -v yum)" ]; then
    echo "yum"
  # Check if pacman package manager is being used
  elif [ -x "$(command -v pacman)" ]; then
    echo "pacman"
  # Check if dnf package manager is being used
  elif [ -x "$(command -v dnf)" ]; then
    echo "dnf"
  # Check if apk package manager is being used
  elif [ -x "$(command -v apk)" ]; then
    echo "apk"
  else
    echo "Package manager not detected"
  fi
}

# Function to update and upgrade the OS using the detected package manager
update_os() {
  package_manager=$(detect_package_manager)
  case $package_manager in
    "apt")
      sudo apt update && sudo apt upgrade -y
      ;;
    "yum")
      sudo yum update -y && sudo yum upgrade -y
      ;;
    "pacman")
      sudo pacman -Syu --noconfirm
      ;;
    "dnf")
      sudo dnf update -y && sudo dnf upgrade -y
      ;;
    "apk")
      sudo apk update && sudo apk upgrade
      ;;
    *)
      echo "Unable to update OS: package manager not detected"
      ;;
  esac
}

# Call the update_os function
update_os