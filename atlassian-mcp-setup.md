# Atlassian Rovo MCP Setup

### 1. Configure AGY

Edit `~/.gemini/config/mcp_config.json` and add under `mcpServers`:

```json
"atlassian-mcp-server": {
  "command": "npx",
  "args": [
    "-y",
    "mcp-remote",
    "https://mcp.atlassian.com/v2/mcp"
  ]
}
```

### 2. Start OAuth on the VM

```bash
npx -y mcp-remote https://mcp.atlassian.com/v2/mcp
```

Copy the authorization URL printed in the terminal and open it on your Mac.

### 3. Forward the OAuth callback

Check the callback port in the URL printed by `mcp-remote`. For example, if it uses port `3334`, run this on your Mac:

```bash
ssh -N -L 3334:127.0.0.1:3334 VM_HOST
```

Replace `VM_HOST` with your VM's SSH hostname or alias. Keep the SSH tunnel and `mcp-remote` process running.

### 4. Complete authentication

Return to the authorization URL in your Mac browser, sign in to Atlassian, and complete the OAuth flow.

### 5. Verify

Restart AGY CLI and run:

```text
/mcp
```

Confirm `atlassian-mcp-server` is ready, then test Jira and Confluence access.
