export PATH="$HOME/.local/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"



export EDITOR=nvim
export EDITOR=code


nvim () {
	kitty @ set-spacing padding=0
	command nvim "$@"
	kitty @ set-spacing padding=20
}

alias wlogout="wlogout --layout ~/.config/wlogout/layout --css ~/.config/wlogout/style.css --buttons-per-row=2"

