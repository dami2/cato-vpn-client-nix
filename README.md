export NIXPKGS_ALLOW_UNFREE=1 && nix-shell --impure

sudo cato-clientd start --gloglevel 0
sudo cato-sdp start --gloglevel 0
