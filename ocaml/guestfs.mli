(* libguestfs generated file
 * WARNING: THIS FILE IS GENERATED BY 'src/generator.ml'.
 * ANY CHANGES YOU MAKE TO THIS FILE WILL BE LOST.
 *
 * Copyright (C) 2009 Red Hat Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 *)

(** For API documentation you should refer to the C API
    in the guestfs(3) manual page.  The OCaml API uses almost
    exactly the same calls. *)

type t
(** A [guestfs_h] handle. *)

exception Error of string
(** This exception is raised when there is an error. *)

val create : unit -> t

val close : t -> unit
(** Handles are closed by the garbage collector when they become
    unreferenced, but callers can also call this in order to
    provide predictable cleanup. *)

type lvm_pv = {
  pv_name : string;
  pv_uuid : string;
  pv_fmt : string;
  pv_size : int64;
  dev_size : int64;
  pv_free : int64;
  pv_used : int64;
  pv_attr : string;
  pv_pe_count : int64;
  pv_pe_alloc_count : int64;
  pv_tags : string;
  pe_start : int64;
  pv_mda_count : int64;
  pv_mda_free : int64;
}

type lvm_vg = {
  vg_name : string;
  vg_uuid : string;
  vg_fmt : string;
  vg_attr : string;
  vg_size : int64;
  vg_free : int64;
  vg_sysid : string;
  vg_extent_size : int64;
  vg_extent_count : int64;
  vg_free_count : int64;
  max_lv : int64;
  max_pv : int64;
  pv_count : int64;
  lv_count : int64;
  snap_count : int64;
  vg_seqno : int64;
  vg_tags : string;
  vg_mda_count : int64;
  vg_mda_free : int64;
}

type lvm_lv = {
  lv_name : string;
  lv_uuid : string;
  lv_attr : string;
  lv_major : int64;
  lv_minor : int64;
  lv_kernel_major : int64;
  lv_kernel_minor : int64;
  lv_size : int64;
  seg_count : int64;
  origin : string;
  snap_percent : float option;
  copy_percent : float option;
  move_pv : string;
  lv_tags : string;
  mirror_log : string;
  modules : string;
}

type stat = {
  dev : int64;
  ino : int64;
  mode : int64;
  nlink : int64;
  uid : int64;
  gid : int64;
  rdev : int64;
  size : int64;
  blksize : int64;
  blocks : int64;
  atime : int64;
  mtime : int64;
  ctime : int64;
}

type statvfs = {
  bsize : int64;
  frsize : int64;
  blocks : int64;
  bfree : int64;
  bavail : int64;
  files : int64;
  ffree : int64;
  favail : int64;
  fsid : int64;
  flag : int64;
  namemax : int64;
}

val test0 : t -> string -> string option -> string array -> bool -> int -> string -> string -> unit
(** internal test function - do not use *)

val test0rint : t -> string -> int
(** internal test function - do not use *)

val test0rinterr : t -> int
(** internal test function - do not use *)

val test0rint64 : t -> string -> int64
(** internal test function - do not use *)

val test0rint64err : t -> int64
(** internal test function - do not use *)

val test0rbool : t -> string -> bool
(** internal test function - do not use *)

val test0rboolerr : t -> bool
(** internal test function - do not use *)

val test0rconststring : t -> string -> string
(** internal test function - do not use *)

val test0rconststringerr : t -> string
(** internal test function - do not use *)

val test0rstring : t -> string -> string
(** internal test function - do not use *)

val test0rstringerr : t -> string
(** internal test function - do not use *)

val test0rstringlist : t -> string -> string array
(** internal test function - do not use *)

val test0rstringlisterr : t -> string array
(** internal test function - do not use *)

val test0rintbool : t -> string -> int * bool
(** internal test function - do not use *)

val test0rintboolerr : t -> int * bool
(** internal test function - do not use *)

val test0rpvlist : t -> string -> lvm_pv array
(** internal test function - do not use *)

val test0rpvlisterr : t -> lvm_pv array
(** internal test function - do not use *)

val test0rvglist : t -> string -> lvm_vg array
(** internal test function - do not use *)

val test0rvglisterr : t -> lvm_vg array
(** internal test function - do not use *)

val test0rlvlist : t -> string -> lvm_lv array
(** internal test function - do not use *)

val test0rlvlisterr : t -> lvm_lv array
(** internal test function - do not use *)

val test0rstat : t -> string -> stat
(** internal test function - do not use *)

val test0rstaterr : t -> stat
(** internal test function - do not use *)

val test0rstatvfs : t -> string -> statvfs
(** internal test function - do not use *)

val test0rstatvfserr : t -> statvfs
(** internal test function - do not use *)

val test0rhashtable : t -> string -> (string * string) list
(** internal test function - do not use *)

val test0rhashtableerr : t -> (string * string) list
(** internal test function - do not use *)

val launch : t -> unit
(** launch the qemu subprocess *)

val wait_ready : t -> unit
(** wait until the qemu subprocess launches *)

val kill_subprocess : t -> unit
(** kill the qemu subprocess *)

val add_drive : t -> string -> unit
(** add an image to examine or modify *)

val add_cdrom : t -> string -> unit
(** add a CD-ROM disk image to examine *)

val add_drive_ro : t -> string -> unit
(** add a drive in snapshot mode (read-only) *)

val config : t -> string -> string option -> unit
(** add qemu parameters *)

val set_qemu : t -> string -> unit
(** set the qemu binary *)

val get_qemu : t -> string
(** get the qemu binary *)

val set_path : t -> string -> unit
(** set the search path *)

val get_path : t -> string
(** get the search path *)

val set_append : t -> string -> unit
(** add options to kernel command line *)

val get_append : t -> string
(** get the additional kernel options *)

val set_autosync : t -> bool -> unit
(** set autosync mode *)

val get_autosync : t -> bool
(** get autosync mode *)

val set_verbose : t -> bool -> unit
(** set verbose mode *)

val get_verbose : t -> bool
(** get verbose mode *)

val is_ready : t -> bool
(** is ready to accept commands *)

val is_config : t -> bool
(** is in configuration state *)

val is_launching : t -> bool
(** is launching subprocess *)

val is_busy : t -> bool
(** is busy processing a command *)

val get_state : t -> int
(** get the current state *)

val set_busy : t -> unit
(** set state to busy *)

val set_ready : t -> unit
(** set state to ready *)

val end_busy : t -> unit
(** leave the busy state *)

val mount : t -> string -> string -> unit
(** mount a guest disk at a position in the filesystem *)

val sync : t -> unit
(** sync disks, writes are flushed through to the disk image *)

val touch : t -> string -> unit
(** update file timestamps or create a new file *)

val cat : t -> string -> string
(** list the contents of a file *)

val ll : t -> string -> string
(** list the files in a directory (long format) *)

val ls : t -> string -> string array
(** list the files in a directory *)

val list_devices : t -> string array
(** list the block devices *)

val list_partitions : t -> string array
(** list the partitions *)

val pvs : t -> string array
(** list the LVM physical volumes (PVs) *)

val vgs : t -> string array
(** list the LVM volume groups (VGs) *)

val lvs : t -> string array
(** list the LVM logical volumes (LVs) *)

val pvs_full : t -> lvm_pv array
(** list the LVM physical volumes (PVs) *)

val vgs_full : t -> lvm_vg array
(** list the LVM volume groups (VGs) *)

val lvs_full : t -> lvm_lv array
(** list the LVM logical volumes (LVs) *)

val read_lines : t -> string -> string array
(** read file as lines *)

val aug_init : t -> string -> int -> unit
(** create a new Augeas handle *)

val aug_close : t -> unit
(** close the current Augeas handle *)

val aug_defvar : t -> string -> string option -> int
(** define an Augeas variable *)

val aug_defnode : t -> string -> string -> string -> int * bool
(** define an Augeas node *)

val aug_get : t -> string -> string
(** look up the value of an Augeas path *)

val aug_set : t -> string -> string -> unit
(** set Augeas path to value *)

val aug_insert : t -> string -> string -> bool -> unit
(** insert a sibling Augeas node *)

val aug_rm : t -> string -> int
(** remove an Augeas path *)

val aug_mv : t -> string -> string -> unit
(** move Augeas node *)

val aug_match : t -> string -> string array
(** return Augeas nodes which match path *)

val aug_save : t -> unit
(** write all pending Augeas changes to disk *)

val aug_load : t -> unit
(** load files into the tree *)

val aug_ls : t -> string -> string array
(** list Augeas nodes under a path *)

val rm : t -> string -> unit
(** remove a file *)

val rmdir : t -> string -> unit
(** remove a directory *)

val rm_rf : t -> string -> unit
(** remove a file or directory recursively *)

val mkdir : t -> string -> unit
(** create a directory *)

val mkdir_p : t -> string -> unit
(** create a directory and parents *)

val chmod : t -> int -> string -> unit
(** change file mode *)

val chown : t -> int -> int -> string -> unit
(** change file owner and group *)

val exists : t -> string -> bool
(** test if file or directory exists *)

val is_file : t -> string -> bool
(** test if file exists *)

val is_dir : t -> string -> bool
(** test if file exists *)

val pvcreate : t -> string -> unit
(** create an LVM physical volume *)

val vgcreate : t -> string -> string array -> unit
(** create an LVM volume group *)

val lvcreate : t -> string -> string -> int -> unit
(** create an LVM volume group *)

val mkfs : t -> string -> string -> unit
(** make a filesystem *)

val sfdisk : t -> string -> int -> int -> int -> string array -> unit
(** create partitions on a block device *)

val write_file : t -> string -> string -> int -> unit
(** create a file *)

val umount : t -> string -> unit
(** unmount a filesystem *)

val mounts : t -> string array
(** show mounted filesystems *)

val umount_all : t -> unit
(** unmount all filesystems *)

val lvm_remove_all : t -> unit
(** remove all LVM LVs, VGs and PVs *)

val file : t -> string -> string
(** determine file type *)

val command : t -> string array -> string
(** run a command from the guest filesystem *)

val command_lines : t -> string array -> string array
(** run a command, returning lines *)

val stat : t -> string -> stat
(** get file information *)

val lstat : t -> string -> stat
(** get file information for a symbolic link *)

val statvfs : t -> string -> statvfs
(** get file system statistics *)

val tune2fs_l : t -> string -> (string * string) list
(** get ext2/ext3/ext4 superblock details *)

val blockdev_setro : t -> string -> unit
(** set block device to read-only *)

val blockdev_setrw : t -> string -> unit
(** set block device to read-write *)

val blockdev_getro : t -> string -> bool
(** is block device set to read-only *)

val blockdev_getss : t -> string -> int
(** get sectorsize of block device *)

val blockdev_getbsz : t -> string -> int
(** get blocksize of block device *)

val blockdev_setbsz : t -> string -> int -> unit
(** set blocksize of block device *)

val blockdev_getsz : t -> string -> int64
(** get total size of device in 512-byte sectors *)

val blockdev_getsize64 : t -> string -> int64
(** get total size of device in bytes *)

val blockdev_flushbufs : t -> string -> unit
(** flush device buffers *)

val blockdev_rereadpt : t -> string -> unit
(** reread partition table *)

val upload : t -> string -> string -> unit
(** upload a file from the local machine *)

val download : t -> string -> string -> unit
(** download a file to the local machine *)

val checksum : t -> string -> string -> string
(** compute MD5, SHAx or CRC checksum of file *)

val tar_in : t -> string -> string -> unit
(** unpack tarfile to directory *)

val tar_out : t -> string -> string -> unit
(** pack directory into tarfile *)

val tgz_in : t -> string -> string -> unit
(** unpack compressed tarball to directory *)

val tgz_out : t -> string -> string -> unit
(** pack directory into compressed tarball *)

val mount_ro : t -> string -> string -> unit
(** mount a guest disk, read-only *)

val mount_options : t -> string -> string -> string -> unit
(** mount a guest disk with mount options *)

val mount_vfs : t -> string -> string -> string -> string -> unit
(** mount a guest disk with mount options and vfstype *)

val debug : t -> string -> string array -> string
(** debugging and internals *)

val lvremove : t -> string -> unit
(** remove an LVM logical volume *)

val vgremove : t -> string -> unit
(** remove an LVM volume group *)

val pvremove : t -> string -> unit
(** remove an LVM physical volume *)

val set_e2label : t -> string -> string -> unit
(** set the ext2/3/4 filesystem label *)

val get_e2label : t -> string -> string
(** get the ext2/3/4 filesystem label *)

val set_e2uuid : t -> string -> string -> unit
(** set the ext2/3/4 filesystem UUID *)

val get_e2uuid : t -> string -> string
(** get the ext2/3/4 filesystem UUID *)

val fsck : t -> string -> string -> int
(** run the filesystem checker *)

val zero : t -> string -> unit
(** write zeroes to the device *)

val grub_install : t -> string -> string -> unit
(** install GRUB *)

val cp : t -> string -> string -> unit
(** copy a file *)

val cp_a : t -> string -> string -> unit
(** copy a file or directory recursively *)

val mv : t -> string -> string -> unit
(** move a file *)

val drop_caches : t -> int -> unit
(** drop kernel page cache, dentries and inodes *)

val dmesg : t -> string
(** return kernel messages *)

val ping_daemon : t -> unit
(** ping the guest daemon *)

val equal : t -> string -> string -> bool
(** test if two files have equal contents *)

val strings : t -> string -> string array
(** print the printable strings in a file *)

val strings_e : t -> string -> string -> string array
(** print the printable strings in a file *)

val hexdump : t -> string -> string
(** dump a file in hexadecimal *)

val zerofree : t -> string -> unit
(** zero unused inodes and disk blocks on ext2/3 filesystem *)

val pvresize : t -> string -> unit
(** resize an LVM physical volume *)

val sfdisk_N : t -> string -> int -> int -> int -> int -> string -> unit
(** modify a single partition on a block device *)

val sfdisk_l : t -> string -> string
(** display the partition table *)

val sfdisk_kernel_geometry : t -> string -> string
(** display the kernel geometry *)

val sfdisk_disk_geometry : t -> string -> string
(** display the disk geometry from the partition table *)

val vg_activate_all : t -> bool -> unit
(** activate or deactivate all volume groups *)

val vg_activate : t -> bool -> string array -> unit
(** activate or deactivate some volume groups *)

val lvresize : t -> string -> int -> unit
(** resize an LVM logical volume *)

val resize2fs : t -> string -> unit
(** resize an ext2/ext3 filesystem *)

val find : t -> string -> string array
(** find all files and directories *)

val e2fsck_f : t -> string -> unit
(** check an ext2/ext3 filesystem *)

val sleep : t -> int -> unit
(** sleep for some seconds *)

val ntfs_3g_probe : t -> bool -> string -> int
(** probe NTFS volume *)

val sh : t -> string -> string
(** run a command via the shell *)

val sh_lines : t -> string -> string array
(** run a command via the shell returning lines *)

val glob_expand : t -> string -> string array
(** expand a wildcard path *)

val scrub_device : t -> string -> unit
(** scrub (securely wipe) a device *)

val scrub_file : t -> string -> unit
(** scrub (securely wipe) a file *)

val scrub_freespace : t -> string -> unit
(** scrub (securely wipe) free space *)

val mkdtemp : t -> string -> string
(** create a temporary directory *)

