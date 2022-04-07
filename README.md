# RDA Game
![lint](https://github.com/RSA-Bots/RDA-Game/actions/workflows/lint/badge.svg)
- Live Place: [link](#)
- Development Place: [link](#)

## Getting Started
1. Install Git
	- Run `winget install Git.Git` if **winget** is available.
	- Go to [https://git-scm.com/download](https://git-scm.com/download) otherwise.
2. Install Tooling
	- Run `./bin/foreman install`
	- Add `%USERPROFILE%\.foreman\bin` to your **PATH**.
3. Install Packages
	- Run `wally install`
4. Install Rojo Roblox Studio Plugin
	- Run `rojo plugin install`
	- Alternatively, the [VSCode rojo extension](https://marketplace.visualstudio.com/items?itemName=evaera.vscode-rojo) can be used to automatically manage installing the plugin.

## Synchronizing
1. Run the **rojo** server by running `rojo serve`.
	- Alternatively, the VSCode rojo extension can be used to start and stop the rojo server.
2. Connect to the server from the Roblox Studio Rojo Plugin.
	- Changes made to the sources will automatically propagate to the Roblox place while the rojo server and plugin are active. Ensure no changes to scripts are made within the place file in Studio as they will be overwritten.

## Workflow
Stay tuned.
