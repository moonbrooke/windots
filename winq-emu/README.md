# WINQ-EMU Stuff

Examples of `.bat` scripts to launch [WINQ-EMU](https://github.com/cmspam/winq-emu) VM. The examples have 6 CPUs with 4GB of RAM setup launched via patched qemu binary.

- `void-install.bat`: Run this to install new guest distro.
- `void.bat`: Run this to launch the installed guest distro. This script expects a shared folder located at `D:/VM/Shared`.

To enable shared folder in guest distro:
```bash
# <tag> is the shared folder name in host machine in all lowercase
sudo mkdir -p /mnt/<tag> & sudo mount -t 9p -o trans=virtio,version=9p2000.L <tag> /mnt/<tag>
```

To auto-mount the shared folder in guest distro:
```bash
# Edit /etc/fstab file and add this line
<tag> /mnt/<tag> 9p trans=virtio,version=9p2000.L,nofail,_netdev 0 0
```
