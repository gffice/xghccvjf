cd ~/
mkdir qemu
#wget 'https://kzh4-my.sharepoint.com/:u:/g/personal/data_kzh4_onmicrosoft_com/EU1lxaTWv0VOg4MsGhPDkNsBOZW5ml-56MJA1y-PcACaSw?e=d6vkTK&download=1' -O ~/system.iso
qemu-img create ~/qemu/system.qcow2 20G
timeout 4h qemu-system-x86_64 -m 4096 -boot cd -hda ~/qemu/system.qcow2 -cdrom ~/system.iso -vnc :1
echo uhcbhj
rm ~/system.iso
echo ohhhhhhhhhhhhhhh
