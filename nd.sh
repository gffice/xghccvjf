cd ~/
wget  -O ~/system.iso
qemu-img create ~/qemu/system.qcow2 20G
timeout 4h qemu-system-x86_64 -m 4096 -hda ~/qemu/system.qcow2 -cdrom ~/system.iso -vnc :1,password=$USER_PASS
echo uhcbhj
rm ~/system.iso
echo ohhhhhhhhhhhhhhh