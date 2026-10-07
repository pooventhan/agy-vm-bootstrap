# Atlassian MCP Setup on Headless Linux VM

### 1. Configure Atlassian MCP

Add this to the AGY MCP configuration:

```json
"atlassian-mcp-server": {
  "command": "npx",
  "args": [
    "-y",
    "mcp-remote",
    "https://mcp.atlassian.com/v2/mcp",
    "3335"
  ]
}
```

The `3335` port is used for the OAuth callback.

### 2. Start AGY

Initially, Atlassian MCP may show:

```text
Unauthorized [Auth Needed]
```

This means OAuth authentication has not been completed yet.

### 3. Stop any existing `mcp-remote` process

If authentication gets stuck or says another instance is running:

```bash
pkill -f mcp-remote
```

### 4. Start `mcp-remote` manually

Run:

```bash
npx -y mcp-remote https://mcp.atlassian.com/v2/mcp 3335 --debug
```

It will display an Atlassian OAuth URL.

### 5. Authenticate from your local computer

Copy the OAuth URL from the VM and open it in your normal browser.

Complete the Atlassian login and authorization.

### 6. Verify authentication

Once authentication succeeds, `mcp-remote` saves the OAuth credentials on the VM:

```text
~/.mcp-auth/
```

### 7. Start AGY normally

After authentication, start AGY normally.

Atlassian MCP should now connect without requiring the browser again.

### Migration to a new VM

When rebuilding the VM, repeat the authentication process.

Do **not** copy `~/.mcp-auth/` into Git or commit it to the setup repository because it contains authentication credentials.
