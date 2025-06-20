/usr/bin/kvm \
  -id 8006 \
  -name 'vm8006,debug-threads=on' \
  -no-shutdown \
  -chardev 'socket,id=qmp,path=/var/run/qemu-server/8006.qmp,server=on,wait=off' \
  -mon 'chardev=qmp,mode=control' \
  -chardev 'socket,id=qmp-event,path=/var/run/qmeventd.sock,reconnect-ms=5000' \
  -mon 'chardev=qmp-event,mode=control' \
  -pidfile /var/run/qemu-server/8006.pid \
  -daemonize \
  -smbios 'type=1,uuid=3dd750ce-d910-44d0-9493-525c0be4e687' \
  -global 'ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off' \
  -smp '2,sockets=1,cores=2,maxcpus=2' \
  -nodefaults \
  -boot 'menu=on,strict=on,reboot-timeout=1000,splash=/usr/share/qemu-server/bootsplash.jpg' \
  -vnc 'unix:/var/run/qemu-server/8006.vnc,password=on' \
  -cpu kvm64,enforce,+kvm_pv_eoi,+kvm_pv_unhalt,+lahf_lm,+sep \
  -m 512 \
  -global 'ICH9-LPC.disable_s3=1' \
  -global 'ICH9-LPC.disable_s4=1' \
  -readconfig /usr/share/qemu-server/pve-q35-4.0.cfg \
  -device 'vmgenid,guid=54d1c06c-8f5b-440f-b5b2-6eab1380e13d' \
  -device 'usb-tablet,id=tablet,bus=ehci.0,port=1' \
  -device 'VGA,id=vga,bus=pcie.0,addr=0x1' \
  -device 'virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x3,free-page-reporting=on' \
  -iscsi 'initiator-name=iqn.1993-08.org.debian:01:aabbccddeeff' \
  -drive 'file=/mnt/pve/cifs-store/template/iso/zero.iso,if=none,id=drive-ide0,media=cdrom,format=raw,aio=threads' \
  -device 'ide-cd,bus=ide.0,unit=0,drive=drive-ide0,id=ide0,bootindex=200' \
  -drive 'file=/mnt/pve/cifs-store/template/iso/one.iso,if=none,id=drive-ide1,media=cdrom,format=raw,aio=threads' \
  -device 'ide-cd,bus=ide.2,unit=0,drive=drive-ide1,id=ide1,bootindex=201' \
  -drive 'file=/mnt/pve/cifs-store/template/iso/two.iso,if=none,id=drive-ide2,media=cdrom,format=raw,aio=threads' \
  -device 'ide-cd,bus=ide.1,unit=0,drive=drive-ide2,id=ide2,bootindex=202' \
  -drive 'file=/mnt/pve/cifs-store/template/iso/three.iso,if=none,id=drive-ide3,media=cdrom,format=raw,aio=threads' \
  -device 'ide-cd,bus=ide.3,unit=0,drive=drive-ide3,id=ide3,bootindex=203' \
  -device 'virtio-scsi-pci,id=scsihw0,bus=pci.0,addr=0x5' \
  -drive 'file=/var/lib/vz/images/100/vm-100-disk-2.qcow2,if=none,id=drive-scsi0,format=qcow2,cache=none,aio=io_uring,detect-zeroes=on' \
  -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0,id=scsi0,bootindex=100,write-cache=on' \
  -netdev 'type=tap,id=net0,ifname=tap8006i0,script=/usr/libexec/qemu-server/pve-bridge,downscript=/usr/libexec/qemu-server/pve-bridgedown,vhost=on' \
  -device 'virtio-net-pci,mac=2E:01:68:F9:9C:87,netdev=net0,bus=pci.0,addr=0x12,id=net0,rx_queue_size=1024,tx_queue_size=256,bootindex=300' \
  -machine 'type=q35+pve0'
