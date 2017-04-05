# Create SWAP memory
sudo fallocate -l 1G /deployswapfile
sudo chmod 600 /deployswapfile
sudo mkswap /deployswapfile
sudo swapon /deployswapfile
sudo swapon --show
