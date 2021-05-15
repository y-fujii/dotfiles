export LD_LIBRARY_PATH=/usr/lib/pipewire-0.3/jack
export PATH=$HOME/.cargo/bin:/usr/bin
export LANG=en_US.UTF-8
export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/less
export PIPEWIRE_LATENCY=256/48000
export MOZ_ENABLE_WAYLAND=1
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5

if test "$(tty)" = "/dev/tty1"; then
	sudo sh -c "echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo"
	exec sway
fi
