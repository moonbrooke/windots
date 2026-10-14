@echo off
REM WINQ-EMU Alpha 10 - Generated VM Configuration
REM 2026-10-09 21:07

"C:\WINQ-EMU\bin\qemu-system-x86_64w_patched.exe" ^
  -machine q35,accel=whpx ^
  -cpu host ^
  -smp 6 ^
  -m 4G ^
  -drive file="D:\VM\Void\void.qcow2",format=qcow2,if=virtio ^
  -cdrom "F:\OS\void-live-x86_64-20250202-base.iso" ^
  -boot d ^
  -device virtio-vga-gl,blob=on,hostmem=4G,venus=on ^
  -display sdl,gl=on ^
  -device virtio-sound-pci ^
  -device virtio-net-pci,netdev=net0 ^
  -netdev user,id=net0,hostfwd=tcp::2223-:22 ^
  -usb ^
  -device usb-tablet

if errorlevel 1 pause
