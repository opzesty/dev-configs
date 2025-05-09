If you are using fedora 42 Sericea on an NVIDA GPU, current you need to be a little hacky.  The open source driver 'nouveau' can seize up and cause wayland to crash, so you might need to use the nvidia proprietary drivers.  First you'll need to install nvidia drivers since the Universal Blue container seems to have dropped support for Fedora 42.
https://rpmfusion.org/Howto/OSTree#Hardware_codecs_with_NVIDIA
https://rpmfusion.org/Howto/NVIDIA#OSTree_.28Silverblue.2FKinoite.2Fetc.29

Then, due to sway developers being unwilling to make using propriety software easy, you'll have to edit the wayland_sessions configuration to exec "sway --unsupported-gpu".  To do that on Sericea...you'll have to get fancy and use `ostree admin unlock --hotfix`

https://www.reddit.com/r/Fedora/comments/y7msf7/how_to_specify_unsupportedgpu_for_swaynvidia/
https://github.com/swaywm/sway/issues/6760
https://discussion.fedoraproject.org/t/how-do-i-edit-a-script-in-usr-bin-on-silverblue/36611

There's more to come to make the nvidia drivers secure-bootable, but I wanted to just get this path documented before I forgot about it.
