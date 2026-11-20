# Docker installation scripts

Scripts for installing or uninstalling Docker Engine on Debian-based Linux systems.

## Scripts

| Script | Purpose |
|---|---|
| `docker_install.sh` | Installs Docker Engine on Debian-compatible systems using the detected release codename. |
| `docker_install_LMDE.sh` | Installs Docker Engine for Linux Mint Debian Edition using the fixed `trixie` repository suite. |
| `uninstall_docker.sh` | Removes Docker Engine, plugins, configuration, data, and repository configuration. |

## Prerequisites

- A Debian-based Linux distribution
- An account with `sudo` access
- An internet connection
- About 2 GB of free disk space

> [!WARNING]
> The scripts modify system package sources and remove Docker-related packages. Review the scripts before running them. The uninstall script also deletes Docker containers, images, volumes, and configuration.

## Installation

Clone the repository and run the appropriate script:

```bash
cd linux-install-scripts/docker
sudo chmod +x docker_install.sh docker_install_LMDE.sh uninstall_docker.sh
sudo ./docker_install.sh
```

For Linux Mint Debian Edition, run:

```bash
sudo ./docker_install_LMDE.sh
```

## Verify the installation

```bash
docker run --rm hello-world
docker --version
docker compose version
```

## Run Docker without sudo

Log out and back in after running:

```bash
sudo groupadd docker
sudo usermod -aG docker "$USER"
```

Verify the configuration with:

```bash
docker run --rm hello-world
```

## Uninstallation

```bash
sudo ./uninstall_docker.sh
```

This permanently removes Docker data stored in `/var/lib/docker` and `/var/lib/containerd`.

## Notes

- `docker_install.sh` derives the Debian package suite from `/etc/os-release`.
- `docker_install_LMDE.sh` currently targets LMDE 7 and sets the suite to `trixie`.
- Docker packages are installed from Docker's official repository rather than distro-provided packages.
```
