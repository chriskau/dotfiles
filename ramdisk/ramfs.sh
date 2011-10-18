#!/bin/bash
ramfs_size_mb=512
mount_point=/private/tmp

ramfs_size_sectors=$((${ramfs_size_mb}*1024*1024/512))
ramdisk_dev=`hdid -nomount ram://${ramfs_size_sectors}`
newfs_hfs -v 'Volatile HD' ${ramdisk_dev}
mkdir -p ${mount_point}
mount -o noatime -t hfs ${ramdisk_dev} ${mount_point}
chown root:wheel ${mount_point}
chmod 1777 ${mount_point}
