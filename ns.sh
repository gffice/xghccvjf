cd ~/
timeout qemu-system-x86_64 -m 4096 -hda ~/qemu/system.qcow2 -vnc :1,password=$USER_PASS
echo ohhhhhhhhhhhhhhh
