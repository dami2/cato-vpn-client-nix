# Cato VPN Nix Package - Agent Guidelines

## Build Commands
- Build package: `nix build .#cato`
- Build default: `nix build`
- Enter shell: `nix develop`
- Test package: `nix build .#cato`

## Usage
Run directly from flake:
- `nix run .#cato-clientd` - Cato client daemon
- `nix run .#cato-sdp` - Cato SDP client
- `nix run .#cato` - Full package (binaries in result/bin/)

## Code Style Guidelines
- Use Nixpkgs standard library functions and patterns
- Follow Nix formatting with 2-space indentation
- Use descriptive variable names (pname, version, src)
- Include proper meta attributes: description, homepage, license, maintainers, platforms
- Use autoPatchelfHook for binary packages
- Keep build phases minimal and focused
- Use substituteInPlace for path replacements in service files
- Maintain platform compatibility in meta.platforms