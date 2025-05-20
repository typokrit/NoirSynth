export EDITOR=nvim
export EDITOR=code


nvim() {
  kitty @ set-spacing padding=0
  command nvim "$@"
  kitty @ set-spacing padding=20  # replace with your default
}


alias wlogout="wlogout --layout ~/.config/wlogout/layout --css ~/.config/wlogout/style.css --buttons-per-row=2"

