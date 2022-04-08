# RDA Game
![lint](https://github.com/RSA-Bots/RDA-Game/workflows/lint/badge.svg)
- Live Place: [link](#)
- Development Place: [link](https://www.roblox.com/games/9304618061/RDA-Game-Dev)

## Getting Started
1. Install Git
	- Run `winget install Git.Git` if **winget** is available.
	- Go to [https://git-scm.com/download](https://git-scm.com/download) otherwise.
2. Next Clone the Repo
	- Open a terminal and navigate to a directory where you want to store this repository.
    - Run `git clone https://github.com/RSA-Bots/RDA-Game`
    - This will then clone the repo to your filesystem.
    - Once the cloning is finished, in your terminal navigate into `./RDA-Game`.
3. Install Tooling
	- Run `./bin/foreman install`
	- Add `%USERPROFILE%\.foreman\bin` to your **PATH**.
4. Install Packages
	- Run `wally install`
5. Install Rojo Roblox Studio Plugin
	- Run `rojo plugin install`
	- Alternatively, the [VSCode rojo extension](https://marketplace.visualstudio.com/items?itemName=evaera.vscode-rojo) can be used to automatically manage installing the plugin.

## Synchronizing
1. Run the **rojo** server by running `rojo serve`.
	- Alternatively, the VSCode rojo extension can be used to start and stop the rojo server.
2. Connect to the server from the Roblox Studio Rojo Plugin.
	- Changes made to the sources will automatically propagate to the Roblox place while the rojo server and plugin are active. Ensure no changes to scripts are made within the place file in Studio as they will be overwritten.

## Workflow
### Live Place
The live place is never to be modified directly. When the development place reaches a release point, the development place will be published to the live place by a trusted publisher.

## Development Place
The development place is the active place used to make non-scripting related changes. The scripts in the development place are synchronized with the head of the develop branch. This place should **NOT** be actively used for script development as it will be overwritten by the next commit to the develop branch.

During periods in which many users would like to collaborate at once, and for large features, the following workflow will allow the fast prototyping and testing, at the cost of granular version control:
1. Branch off of the development place.
	- If there is an existing place used previously for collaboration, feel free to publish the development place into the existing place so long nobody else is using it.
2. Have one user host a [VSCode live share](https://visualstudio.microsoft.com/services/live-share/) server as well as the Rojo server and plugin to synchronize changes to the new place.
3. Have the host give the other users access to the live share.
	- This allows for other users to edit the scripts directly on the host's filesystem, bypassing the need for using Git and makes multi-user testing significantly easier.
4. At the end of the feature, all changes will need to be committed with a summary of what has changed.
	- This approach necessarily cannot take advantage of version control, as all collaborators' changes will be squashed into a single commit. Please ensure a summary of the changes reside within the commit message! Granularity is up to what seems most appropriate, no need to get into hyper-specific details except for bug fixes.
5. Any non-scripting related changes will have to be merged back into the development place **carefully**!
