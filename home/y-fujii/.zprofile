export PATH=$HOME/.cargo/bin:/usr/bin
export LANG=en_US.UTF-8
export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/less
export PIPEWIRE_LATENCY=256/48000
export MOZ_ENABLE_WAYLAND=1
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5

if test "$(tty)" = "/dev/tty1"; then
	exec sway
fi
