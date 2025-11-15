# News

## MCP Server Setup

### Playwright MCP Server

1. Start the Docker MCP Playwright server on `http://localhost:8931`

2. Add to project:
```bash
claude mcp add --transport http playwright --scope project http://localhost:8931/mcp
```

3. Restart Claude Code to load the server

4. Verify with `/mcp` command
