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
