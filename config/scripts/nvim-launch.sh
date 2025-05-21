# ~/.local/bin/nvim-launch
#!/bin/bash
kitty @ set-spacing padding=0
nvim "$@"
kitty @ set-spacing padding=20

