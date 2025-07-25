/usr/bin/kvm \
  -id 8006 \
  -name 'simple,debug-threads=on' \
  -no-shutdown \
  -chardev 'socket,id=qmp,path=/var/run/qemu-server/8006.qmp,server=on,wait=off' \
  -mon 'chardev=qmp,mode=control' \
  -chardev 'socket,id=qmp-event,path=/var/run/qmeventd.sock,reconnect-ms=5000' \
  -mon 'chardev=qmp-event,mode=control' \
  -pidfile /var/run/qemu-server/8006.pid \
  -daemonize \
  -smbios 'type=1,uuid=7b10d7af-b932-4c66-b2c3-3996152ec465' \
  -smp '3,sockets=1,cores=3,maxcpus=3' \
  -nodefaults \
  -boot 'menu=on,strict=on,reboot-timeout=1000,splash=/usr/share/qemu-server/bootsplash.jpg' \
  -vnc 'unix:/var/run/qemu-server/8006.vnc,password=on' \
  -cpu kvm64,enforce,+kvm_pv_eoi,+kvm_pv_unhalt,+lahf_lm,+sep \
  -m 768 \
  -object '{"id":"throttle-drive-scsi0","limits":{},"qom-type":"throttle-group"}' \
  -object '{"id":"throttle-drive-scsi1","limits":{},"qom-type":"throttle-group"}' \
  -object '{"id":"throttle-drive-scsi2","limits":{},"qom-type":"throttle-group"}' \
  -object '{"id":"throttle-drive-scsi3","limits":{},"qom-type":"throttle-group"}' \
  -object '{"id":"throttle-drive-scsi4","limits":{},"qom-type":"throttle-group"}' \
  -object '{"id":"throttle-drive-scsi5","limits":{},"qom-type":"throttle-group"}' \
  -object '{"id":"throttle-drive-scsi6","limits":{},"qom-type":"throttle-group"}' \
  -object '{"id":"throttle-drive-scsi7","limits":{},"qom-type":"throttle-group"}' \
  -global 'PIIX4_PM.disable_s3=1' \
  -global 'PIIX4_PM.disable_s4=1' \
  -device 'pci-bridge,id=pci.1,chassis_nr=1,bus=pci.0,addr=0x1e' \
  -device 'pci-bridge,id=pci.2,chassis_nr=2,bus=pci.0,addr=0x1f' \
  -device 'vmgenid,guid=c773c261-d800-4348-1010-1010add53cf8' \
  -device 'piix3-usb-uhci,id=uhci,bus=pci.0,addr=0x1.0x2' \
  -device 'usb-tablet,id=tablet,bus=uhci.0,port=1' \
  -device 'VGA,id=vga,bus=pci.0,addr=0x2' \
  -device 'virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x3,free-page-reporting=on' \
  -iscsi 'initiator-name=iqn.1993-08.org.debian:01:aabbccddeeff' \
  -device 'ide-cd,bus=ide.1,unit=0,id=ide2,bootindex=200' \
  -device 'virtio-scsi-pci,id=scsihw0,bus=pci.0,addr=0x5' \
  -blockdev '{"detect-zeroes":"unmap","discard":"unmap","driver":"throttle","file":{"cache":{"direct":true,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"raw","file":{"auth-client-required":["none"],"cache":{"direct":true,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"rbd","image":"vm-8006-disk-0","node-name":"e8e1af6f55c6a2466f178045aa79710","pool":"cpool","read-only":false,"server":[{"host":"127.0.0.42","port":"3300"},{"host":"127.0.0.21","port":"3300"},{"host":"::1","port":"3300"}]},"node-name":"f8e1af6f55c6a2466f178045aa79710","read-only":false},"node-name":"drive-scsi0","read-only":false,"throttle-group":"throttle-drive-scsi0"}' \
  -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0,id=scsi0,device_id=drive-scsi0,bootindex=100,write-cache=on' \
  -blockdev '{"detect-zeroes":"unmap","discard":"unmap","driver":"throttle","file":{"cache":{"direct":false,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"raw","file":{"auth-client-required":["none"],"cache":{"direct":false,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"rbd","image":"vm-8006-disk-0","node-name":"e3990bba2ed1f48c5bb23e9f37b4cec","pool":"cpool","read-only":false,"server":[{"host":"127.0.0.42","port":"3300"},{"host":"127.0.0.21","port":"3300"},{"host":"::1","port":"3300"}]},"node-name":"f3990bba2ed1f48c5bb23e9f37b4cec","read-only":false},"node-name":"drive-scsi1","read-only":false,"throttle-group":"throttle-drive-scsi1"}' \
  -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=1,drive=drive-scsi1,id=scsi1,device_id=drive-scsi1,write-cache=on' \
  -blockdev '{"detect-zeroes":"unmap","discard":"unmap","driver":"throttle","file":{"cache":{"direct":false,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"raw","file":{"auth-client-required":["none"],"cache":{"direct":false,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"rbd","image":"vm-8006-disk-0","node-name":"e3beccc2a8f2eacb8b5df8055a7d093","pool":"cpool","read-only":false,"server":[{"host":"127.0.0.42","port":"3300"},{"host":"127.0.0.21","port":"3300"},{"host":"::1","port":"3300"}]},"node-name":"f3beccc2a8f2eacb8b5df8055a7d093","read-only":false},"node-name":"drive-scsi2","read-only":false,"throttle-group":"throttle-drive-scsi2"}' \
  -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=2,drive=drive-scsi2,id=scsi2,device_id=drive-scsi2,write-cache=off' \
  -blockdev '{"detect-zeroes":"unmap","discard":"unmap","driver":"throttle","file":{"cache":{"direct":true,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"raw","file":{"auth-client-required":["none"],"cache":{"direct":true,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"rbd","image":"vm-8006-disk-0","node-name":"eef923d5dfcee93fbc712b03f9f21af","pool":"cpool","read-only":false,"server":[{"host":"127.0.0.42","port":"3300"},{"host":"127.0.0.21","port":"3300"},{"host":"::1","port":"3300"}]},"node-name":"fef923d5dfcee93fbc712b03f9f21af","read-only":false},"node-name":"drive-scsi3","read-only":false,"throttle-group":"throttle-drive-scsi3"}' \
  -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=3,drive=drive-scsi3,id=scsi3,device_id=drive-scsi3,write-cache=off' \
  -blockdev '{"detect-zeroes":"unmap","discard":"unmap","driver":"throttle","file":{"cache":{"direct":true,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"raw","file":{"aio":"io_uring","cache":{"direct":true,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"host_device","filename":"/dev/rbd-pve/fc4181a6-56eb-4f68-b452-8ba1f381ca2a/cpool/vm-8006-disk-0","node-name":"eb2c7a292f03b9f6d015cf83ae79730","read-only":false},"node-name":"fb2c7a292f03b9f6d015cf83ae79730","read-only":false},"node-name":"drive-scsi4","read-only":false,"throttle-group":"throttle-drive-scsi4"}' \
  -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=4,drive=drive-scsi4,id=scsi4,device_id=drive-scsi4,write-cache=on' \
  -blockdev '{"detect-zeroes":"unmap","discard":"unmap","driver":"throttle","file":{"cache":{"direct":false,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"raw","file":{"aio":"threads","cache":{"direct":false,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"host_device","filename":"/dev/rbd-pve/fc4181a6-56eb-4f68-b452-8ba1f381ca2a/cpool/vm-8006-disk-0","node-name":"e5258ec75558b1f102af1e20e677fd0","read-only":false},"node-name":"f5258ec75558b1f102af1e20e677fd0","read-only":false},"node-name":"drive-scsi5","read-only":false,"throttle-group":"throttle-drive-scsi5"}' \
  -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=5,drive=drive-scsi5,id=scsi5,device_id=drive-scsi5,write-cache=on' \
  -blockdev '{"detect-zeroes":"unmap","discard":"unmap","driver":"throttle","file":{"cache":{"direct":false,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"raw","file":{"aio":"threads","cache":{"direct":false,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"host_device","filename":"/dev/rbd-pve/fc4181a6-56eb-4f68-b452-8ba1f381ca2a/cpool/vm-8006-disk-0","node-name":"edb33cdcea8ec3e2225509c4945227e","read-only":false},"node-name":"fdb33cdcea8ec3e2225509c4945227e","read-only":false},"node-name":"drive-scsi6","read-only":false,"throttle-group":"throttle-drive-scsi6"}' \
  -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=6,drive=drive-scsi6,id=scsi6,device_id=drive-scsi6,write-cache=off' \
  -blockdev '{"detect-zeroes":"unmap","discard":"unmap","driver":"throttle","file":{"cache":{"direct":true,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"raw","file":{"aio":"io_uring","cache":{"direct":true,"no-flush":false},"detect-zeroes":"unmap","discard":"unmap","driver":"host_device","filename":"/dev/rbd-pve/fc4181a6-56eb-4f68-b452-8ba1f381ca2a/cpool/vm-8006-disk-0","node-name":"eb0b017124a47505c97a5da052e0141","read-only":false},"node-name":"fb0b017124a47505c97a5da052e0141","read-only":false},"node-name":"drive-scsi7","read-only":false,"throttle-group":"throttle-drive-scsi7"}' \
  -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=7,drive=drive-scsi7,id=scsi7,device_id=drive-scsi7,write-cache=off' \
  -netdev 'type=tap,id=net0,ifname=tap8006i0,script=/usr/libexec/qemu-server/pve-bridge,downscript=/usr/libexec/qemu-server/pve-bridgedown,vhost=on' \
  -device 'virtio-net-pci,mac=A2:C0:43:77:08:A0,netdev=net0,bus=pci.0,addr=0x12,id=net0,rx_queue_size=1024,tx_queue_size=256,bootindex=300' \
  -machine 'type=pc+pve0'
