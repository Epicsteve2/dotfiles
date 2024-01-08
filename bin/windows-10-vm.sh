#!/bin/sh
WINIMG=/home/stephen/Desktop/Win10_22H2_English_x64v1.iso
VIRTIMG=/home/stephen/Desktop/virtio-win-0.1.240.iso
qemu-system-x86_64 \
	--enable-kvm \
	-drive driver=raw,file="/home/stephen/VirtualBox VMs/win10.img",if=virtio \
	-m 4096 \
	-net nic,model=virtio \
	-net user \
	-cdrom ${WINIMG} \
	-drive file=${VIRTIMG},index=3,media=cdrom \
	-rtc base=localtime,clock=host \
	-smp cores=2 \
	-usb -device usb-tablet \
	-net user,smb="$HOME"
