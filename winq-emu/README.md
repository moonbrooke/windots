# WINQ-EMU Stuff

- `void-install.bat`: Example script to install new distro.
- `void.bat`: Example script to launch the guest distro after installation with shared folder enabled.

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
