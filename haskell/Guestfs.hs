{- libguestfs generated file
   WARNING: THIS FILE IS GENERATED BY 'src/generator.ml'.
   ANY CHANGES YOU MAKE TO THIS FILE WILL BE LOST.
  
   Copyright (C) 2009 Red Hat Inc.
  
   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.
  
   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.
  
   You should have received a copy of the GNU Lesser General Public
   License along with this library; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-}

{-# INCLUDE <guestfs.h> #-}
{-# LANGUAGE ForeignFunctionInterface #-}

module Guestfs (
  create,
  launch,
  wait_ready,
  kill_subprocess,
  add_drive,
  add_cdrom,
  config,
  set_qemu,
  set_path,
  set_append,
  set_busy,
  set_ready,
  end_busy,
  mount,
  sync,
  touch,
  aug_close,
  aug_set,
  aug_mv,
  aug_save,
  aug_load,
  rm,
  rmdir,
  rm_rf,
  mkdir,
  mkdir_p,
  pvcreate,
  vgcreate,
  mkfs,
  umount,
  umount_all,
  lvm_remove_all,
  blockdev_setro,
  blockdev_setrw,
  blockdev_flushbufs,
  blockdev_rereadpt,
  upload,
  download,
  tar_in,
  tar_out,
  tgz_in,
  tgz_out,
  mount_ro,
  mount_options,
  mount_vfs,
  lvremove,
  vgremove,
  pvremove,
  set_e2label,
  set_e2uuid,
  zero,
  grub_install,
  cp,
  cp_a,
  mv,
  ping_daemon,
  zerofree,
  pvresize,
  resize2fs,
  e2fsck_f
  ) where
import Foreign
import Foreign.C
import IO
import Control.Exception
import Data.Typeable

data GuestfsS = GuestfsS            -- represents the opaque C struct
type GuestfsP = Ptr GuestfsS        -- guestfs_h *
type GuestfsH = ForeignPtr GuestfsS -- guestfs_h * with attached finalizer

-- XXX define properly later XXX
data PV = PV
data VG = VG
data LV = LV
data IntBool = IntBool
data Stat = Stat
data StatVFS = StatVFS
data Hashtable = Hashtable

foreign import ccall unsafe "guestfs_create" c_create
  :: IO GuestfsP
foreign import ccall unsafe "&guestfs_close" c_close
  :: FunPtr (GuestfsP -> IO ())
foreign import ccall unsafe "guestfs_set_error_handler" c_set_error_handler
  :: GuestfsP -> Ptr CInt -> Ptr CInt -> IO ()

create :: IO GuestfsH
create = do
  p <- c_create
  c_set_error_handler p nullPtr nullPtr
  h <- newForeignPtr c_close p
  return h

foreign import ccall unsafe "guestfs_last_error" c_last_error
  :: GuestfsP -> IO CString

-- last_error :: GuestfsH -> IO (Maybe String)
-- last_error h = do
--   str <- withForeignPtr h (\p -> c_last_error p)
--   maybePeek peekCString str

last_error :: GuestfsH -> IO (String)
last_error h = do
  str <- withForeignPtr h (\p -> c_last_error p)
  if (str == nullPtr)
    then return "no error"
    else peekCString str

foreign import ccall unsafe "guestfs_launch" c_launch
  :: GuestfsP -> IO (CInt)

launch :: GuestfsH -> IO ()
launch h = do
  r <- withForeignPtr h (\p -> c_launch p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_wait_ready" c_wait_ready
  :: GuestfsP -> IO (CInt)

wait_ready :: GuestfsH -> IO ()
wait_ready h = do
  r <- withForeignPtr h (\p -> c_wait_ready p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_kill_subprocess" c_kill_subprocess
  :: GuestfsP -> IO (CInt)

kill_subprocess :: GuestfsH -> IO ()
kill_subprocess h = do
  r <- withForeignPtr h (\p -> c_kill_subprocess p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_add_drive" c_add_drive
  :: GuestfsP -> CString -> IO (CInt)

add_drive :: GuestfsH -> String -> IO ()
add_drive h filename = do
  r <- withCString filename $ \filename -> withForeignPtr h (\p -> c_add_drive p filename)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_add_cdrom" c_add_cdrom
  :: GuestfsP -> CString -> IO (CInt)

add_cdrom :: GuestfsH -> String -> IO ()
add_cdrom h filename = do
  r <- withCString filename $ \filename -> withForeignPtr h (\p -> c_add_cdrom p filename)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_config" c_config
  :: GuestfsP -> CString -> CString -> IO (CInt)

config :: GuestfsH -> String -> Maybe String -> IO ()
config h qemuparam qemuvalue = do
  r <- withCString qemuparam $ \qemuparam -> maybeWith withCString qemuvalue $ \qemuvalue -> withForeignPtr h (\p -> c_config p qemuparam qemuvalue)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_set_qemu" c_set_qemu
  :: GuestfsP -> CString -> IO (CInt)

set_qemu :: GuestfsH -> String -> IO ()
set_qemu h qemu = do
  r <- withCString qemu $ \qemu -> withForeignPtr h (\p -> c_set_qemu p qemu)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_set_path" c_set_path
  :: GuestfsP -> CString -> IO (CInt)

set_path :: GuestfsH -> String -> IO ()
set_path h path = do
  r <- withCString path $ \path -> withForeignPtr h (\p -> c_set_path p path)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_set_append" c_set_append
  :: GuestfsP -> CString -> IO (CInt)

set_append :: GuestfsH -> String -> IO ()
set_append h append = do
  r <- withCString append $ \append -> withForeignPtr h (\p -> c_set_append p append)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_set_busy" c_set_busy
  :: GuestfsP -> IO (CInt)

set_busy :: GuestfsH -> IO ()
set_busy h = do
  r <- withForeignPtr h (\p -> c_set_busy p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_set_ready" c_set_ready
  :: GuestfsP -> IO (CInt)

set_ready :: GuestfsH -> IO ()
set_ready h = do
  r <- withForeignPtr h (\p -> c_set_ready p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_end_busy" c_end_busy
  :: GuestfsP -> IO (CInt)

end_busy :: GuestfsH -> IO ()
end_busy h = do
  r <- withForeignPtr h (\p -> c_end_busy p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_mount" c_mount
  :: GuestfsP -> CString -> CString -> IO (CInt)

mount :: GuestfsH -> String -> String -> IO ()
mount h device mountpoint = do
  r <- withCString device $ \device -> withCString mountpoint $ \mountpoint -> withForeignPtr h (\p -> c_mount p device mountpoint)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_sync" c_sync
  :: GuestfsP -> IO (CInt)

sync :: GuestfsH -> IO ()
sync h = do
  r <- withForeignPtr h (\p -> c_sync p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_touch" c_touch
  :: GuestfsP -> CString -> IO (CInt)

touch :: GuestfsH -> String -> IO ()
touch h path = do
  r <- withCString path $ \path -> withForeignPtr h (\p -> c_touch p path)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_aug_close" c_aug_close
  :: GuestfsP -> IO (CInt)

aug_close :: GuestfsH -> IO ()
aug_close h = do
  r <- withForeignPtr h (\p -> c_aug_close p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_aug_set" c_aug_set
  :: GuestfsP -> CString -> CString -> IO (CInt)

aug_set :: GuestfsH -> String -> String -> IO ()
aug_set h path val = do
  r <- withCString path $ \path -> withCString val $ \val -> withForeignPtr h (\p -> c_aug_set p path val)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_aug_mv" c_aug_mv
  :: GuestfsP -> CString -> CString -> IO (CInt)

aug_mv :: GuestfsH -> String -> String -> IO ()
aug_mv h src dest = do
  r <- withCString src $ \src -> withCString dest $ \dest -> withForeignPtr h (\p -> c_aug_mv p src dest)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_aug_save" c_aug_save
  :: GuestfsP -> IO (CInt)

aug_save :: GuestfsH -> IO ()
aug_save h = do
  r <- withForeignPtr h (\p -> c_aug_save p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_aug_load" c_aug_load
  :: GuestfsP -> IO (CInt)

aug_load :: GuestfsH -> IO ()
aug_load h = do
  r <- withForeignPtr h (\p -> c_aug_load p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_rm" c_rm
  :: GuestfsP -> CString -> IO (CInt)

rm :: GuestfsH -> String -> IO ()
rm h path = do
  r <- withCString path $ \path -> withForeignPtr h (\p -> c_rm p path)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_rmdir" c_rmdir
  :: GuestfsP -> CString -> IO (CInt)

rmdir :: GuestfsH -> String -> IO ()
rmdir h path = do
  r <- withCString path $ \path -> withForeignPtr h (\p -> c_rmdir p path)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_rm_rf" c_rm_rf
  :: GuestfsP -> CString -> IO (CInt)

rm_rf :: GuestfsH -> String -> IO ()
rm_rf h path = do
  r <- withCString path $ \path -> withForeignPtr h (\p -> c_rm_rf p path)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_mkdir" c_mkdir
  :: GuestfsP -> CString -> IO (CInt)

mkdir :: GuestfsH -> String -> IO ()
mkdir h path = do
  r <- withCString path $ \path -> withForeignPtr h (\p -> c_mkdir p path)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_mkdir_p" c_mkdir_p
  :: GuestfsP -> CString -> IO (CInt)

mkdir_p :: GuestfsH -> String -> IO ()
mkdir_p h path = do
  r <- withCString path $ \path -> withForeignPtr h (\p -> c_mkdir_p p path)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_pvcreate" c_pvcreate
  :: GuestfsP -> CString -> IO (CInt)

pvcreate :: GuestfsH -> String -> IO ()
pvcreate h device = do
  r <- withCString device $ \device -> withForeignPtr h (\p -> c_pvcreate p device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_vgcreate" c_vgcreate
  :: GuestfsP -> CString -> Ptr CString -> IO (CInt)

vgcreate :: GuestfsH -> String -> [String] -> IO ()
vgcreate h volgroup physvols = do
  r <- withCString volgroup $ \volgroup -> withMany withCString physvols $ \physvols -> withArray0 nullPtr physvols $ \physvols -> withForeignPtr h (\p -> c_vgcreate p volgroup physvols)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_mkfs" c_mkfs
  :: GuestfsP -> CString -> CString -> IO (CInt)

mkfs :: GuestfsH -> String -> String -> IO ()
mkfs h fstype device = do
  r <- withCString fstype $ \fstype -> withCString device $ \device -> withForeignPtr h (\p -> c_mkfs p fstype device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_umount" c_umount
  :: GuestfsP -> CString -> IO (CInt)

umount :: GuestfsH -> String -> IO ()
umount h pathordevice = do
  r <- withCString pathordevice $ \pathordevice -> withForeignPtr h (\p -> c_umount p pathordevice)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_umount_all" c_umount_all
  :: GuestfsP -> IO (CInt)

umount_all :: GuestfsH -> IO ()
umount_all h = do
  r <- withForeignPtr h (\p -> c_umount_all p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_lvm_remove_all" c_lvm_remove_all
  :: GuestfsP -> IO (CInt)

lvm_remove_all :: GuestfsH -> IO ()
lvm_remove_all h = do
  r <- withForeignPtr h (\p -> c_lvm_remove_all p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_blockdev_setro" c_blockdev_setro
  :: GuestfsP -> CString -> IO (CInt)

blockdev_setro :: GuestfsH -> String -> IO ()
blockdev_setro h device = do
  r <- withCString device $ \device -> withForeignPtr h (\p -> c_blockdev_setro p device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_blockdev_setrw" c_blockdev_setrw
  :: GuestfsP -> CString -> IO (CInt)

blockdev_setrw :: GuestfsH -> String -> IO ()
blockdev_setrw h device = do
  r <- withCString device $ \device -> withForeignPtr h (\p -> c_blockdev_setrw p device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_blockdev_flushbufs" c_blockdev_flushbufs
  :: GuestfsP -> CString -> IO (CInt)

blockdev_flushbufs :: GuestfsH -> String -> IO ()
blockdev_flushbufs h device = do
  r <- withCString device $ \device -> withForeignPtr h (\p -> c_blockdev_flushbufs p device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_blockdev_rereadpt" c_blockdev_rereadpt
  :: GuestfsP -> CString -> IO (CInt)

blockdev_rereadpt :: GuestfsH -> String -> IO ()
blockdev_rereadpt h device = do
  r <- withCString device $ \device -> withForeignPtr h (\p -> c_blockdev_rereadpt p device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_upload" c_upload
  :: GuestfsP -> CString -> CString -> IO (CInt)

upload :: GuestfsH -> String -> String -> IO ()
upload h filename remotefilename = do
  r <- withCString filename $ \filename -> withCString remotefilename $ \remotefilename -> withForeignPtr h (\p -> c_upload p filename remotefilename)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_download" c_download
  :: GuestfsP -> CString -> CString -> IO (CInt)

download :: GuestfsH -> String -> String -> IO ()
download h remotefilename filename = do
  r <- withCString remotefilename $ \remotefilename -> withCString filename $ \filename -> withForeignPtr h (\p -> c_download p remotefilename filename)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_tar_in" c_tar_in
  :: GuestfsP -> CString -> CString -> IO (CInt)

tar_in :: GuestfsH -> String -> String -> IO ()
tar_in h tarfile directory = do
  r <- withCString tarfile $ \tarfile -> withCString directory $ \directory -> withForeignPtr h (\p -> c_tar_in p tarfile directory)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_tar_out" c_tar_out
  :: GuestfsP -> CString -> CString -> IO (CInt)

tar_out :: GuestfsH -> String -> String -> IO ()
tar_out h directory tarfile = do
  r <- withCString directory $ \directory -> withCString tarfile $ \tarfile -> withForeignPtr h (\p -> c_tar_out p directory tarfile)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_tgz_in" c_tgz_in
  :: GuestfsP -> CString -> CString -> IO (CInt)

tgz_in :: GuestfsH -> String -> String -> IO ()
tgz_in h tarball directory = do
  r <- withCString tarball $ \tarball -> withCString directory $ \directory -> withForeignPtr h (\p -> c_tgz_in p tarball directory)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_tgz_out" c_tgz_out
  :: GuestfsP -> CString -> CString -> IO (CInt)

tgz_out :: GuestfsH -> String -> String -> IO ()
tgz_out h directory tarball = do
  r <- withCString directory $ \directory -> withCString tarball $ \tarball -> withForeignPtr h (\p -> c_tgz_out p directory tarball)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_mount_ro" c_mount_ro
  :: GuestfsP -> CString -> CString -> IO (CInt)

mount_ro :: GuestfsH -> String -> String -> IO ()
mount_ro h device mountpoint = do
  r <- withCString device $ \device -> withCString mountpoint $ \mountpoint -> withForeignPtr h (\p -> c_mount_ro p device mountpoint)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_mount_options" c_mount_options
  :: GuestfsP -> CString -> CString -> CString -> IO (CInt)

mount_options :: GuestfsH -> String -> String -> String -> IO ()
mount_options h options device mountpoint = do
  r <- withCString options $ \options -> withCString device $ \device -> withCString mountpoint $ \mountpoint -> withForeignPtr h (\p -> c_mount_options p options device mountpoint)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_mount_vfs" c_mount_vfs
  :: GuestfsP -> CString -> CString -> CString -> CString -> IO (CInt)

mount_vfs :: GuestfsH -> String -> String -> String -> String -> IO ()
mount_vfs h options vfstype device mountpoint = do
  r <- withCString options $ \options -> withCString vfstype $ \vfstype -> withCString device $ \device -> withCString mountpoint $ \mountpoint -> withForeignPtr h (\p -> c_mount_vfs p options vfstype device mountpoint)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_lvremove" c_lvremove
  :: GuestfsP -> CString -> IO (CInt)

lvremove :: GuestfsH -> String -> IO ()
lvremove h device = do
  r <- withCString device $ \device -> withForeignPtr h (\p -> c_lvremove p device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_vgremove" c_vgremove
  :: GuestfsP -> CString -> IO (CInt)

vgremove :: GuestfsH -> String -> IO ()
vgremove h vgname = do
  r <- withCString vgname $ \vgname -> withForeignPtr h (\p -> c_vgremove p vgname)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_pvremove" c_pvremove
  :: GuestfsP -> CString -> IO (CInt)

pvremove :: GuestfsH -> String -> IO ()
pvremove h device = do
  r <- withCString device $ \device -> withForeignPtr h (\p -> c_pvremove p device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_set_e2label" c_set_e2label
  :: GuestfsP -> CString -> CString -> IO (CInt)

set_e2label :: GuestfsH -> String -> String -> IO ()
set_e2label h device label = do
  r <- withCString device $ \device -> withCString label $ \label -> withForeignPtr h (\p -> c_set_e2label p device label)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_set_e2uuid" c_set_e2uuid
  :: GuestfsP -> CString -> CString -> IO (CInt)

set_e2uuid :: GuestfsH -> String -> String -> IO ()
set_e2uuid h device uuid = do
  r <- withCString device $ \device -> withCString uuid $ \uuid -> withForeignPtr h (\p -> c_set_e2uuid p device uuid)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_zero" c_zero
  :: GuestfsP -> CString -> IO (CInt)

zero :: GuestfsH -> String -> IO ()
zero h device = do
  r <- withCString device $ \device -> withForeignPtr h (\p -> c_zero p device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_grub_install" c_grub_install
  :: GuestfsP -> CString -> CString -> IO (CInt)

grub_install :: GuestfsH -> String -> String -> IO ()
grub_install h root device = do
  r <- withCString root $ \root -> withCString device $ \device -> withForeignPtr h (\p -> c_grub_install p root device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_cp" c_cp
  :: GuestfsP -> CString -> CString -> IO (CInt)

cp :: GuestfsH -> String -> String -> IO ()
cp h src dest = do
  r <- withCString src $ \src -> withCString dest $ \dest -> withForeignPtr h (\p -> c_cp p src dest)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_cp_a" c_cp_a
  :: GuestfsP -> CString -> CString -> IO (CInt)

cp_a :: GuestfsH -> String -> String -> IO ()
cp_a h src dest = do
  r <- withCString src $ \src -> withCString dest $ \dest -> withForeignPtr h (\p -> c_cp_a p src dest)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_mv" c_mv
  :: GuestfsP -> CString -> CString -> IO (CInt)

mv :: GuestfsH -> String -> String -> IO ()
mv h src dest = do
  r <- withCString src $ \src -> withCString dest $ \dest -> withForeignPtr h (\p -> c_mv p src dest)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_ping_daemon" c_ping_daemon
  :: GuestfsP -> IO (CInt)

ping_daemon :: GuestfsH -> IO ()
ping_daemon h = do
  r <- withForeignPtr h (\p -> c_ping_daemon p)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_zerofree" c_zerofree
  :: GuestfsP -> CString -> IO (CInt)

zerofree :: GuestfsH -> String -> IO ()
zerofree h device = do
  r <- withCString device $ \device -> withForeignPtr h (\p -> c_zerofree p device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_pvresize" c_pvresize
  :: GuestfsP -> CString -> IO (CInt)

pvresize :: GuestfsH -> String -> IO ()
pvresize h device = do
  r <- withCString device $ \device -> withForeignPtr h (\p -> c_pvresize p device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_resize2fs" c_resize2fs
  :: GuestfsP -> CString -> IO (CInt)

resize2fs :: GuestfsH -> String -> IO ()
resize2fs h device = do
  r <- withCString device $ \device -> withForeignPtr h (\p -> c_resize2fs p device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

foreign import ccall unsafe "guestfs_e2fsck_f" c_e2fsck_f
  :: GuestfsP -> CString -> IO (CInt)

e2fsck_f :: GuestfsH -> String -> IO ()
e2fsck_f h device = do
  r <- withCString device $ \device -> withForeignPtr h (\p -> c_e2fsck_f p device)
  if (r == -1)
    then do
      err <- last_error h
      fail err
    else return ()

