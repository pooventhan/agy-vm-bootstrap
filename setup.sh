# Install Node
curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v

# Install GitKraken CLI
# Refer here for versions: https://github.com/gitkraken/gk-cli/releases
wget https://github.com/gitkraken/gk-cli/releases/download/v3.1.76/gk_3.1.76_linux_amd64.deb
sudo apt install ./gk_3.1.76_linux_amd64.deb
gk --version
gk auth login

# Install AGY CLI and follow the setup guide:
curl -fsSL https://antigravity.google/cli/install.sh | bash

# Create target dirs on the VM
ssh user@vm-host 'mkdir -p ~/.gemini/config ~/.gemini/antigravity-cli'

# Copy MCP config
rsync -avz ~/.gemini/config/mcp_config.json \
  user@vm-host:~/.gemini/config/

# Copy settings
rsync -avz ~/.gemini/antigravity-cli/settings.json \
  user@vm-host:~/.gemini/antigravity-cli/
