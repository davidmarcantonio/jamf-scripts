# Jamf Scripts
These are scripts that are used for various aspects of Jamf. Some are for workflows used in policies (onboarding setups, tweaking settings, etc.) and others are used in Extension Attributes for data reporting (Chrome extensions installed, whether a specific app is up to date, etc.).

***

## Workflow/Policy Scripts
### Zero touch deployment
The zero touch deployment scripts are aimed at setting up Macs with no user action outside of the user creating their account during first boot. After the computer completes that process and logs into the desktop, DEP Notify kicks off and runs these scripts in the background.
#### Base script
I tend to let Homebrew do the heavy lifting of setting up and installing binaries and third party apps. We want to ensure that every new deployment of macOS is handed to the user with all apps up to date, and any cruft apps removed (iSuite).
1. Install any assets unique to my environment. Company icons, backgrounds, etc. Just the assets themselves.
2. Install the latest version of Apple's Command Line tools. Install Homebrew. Set proper permissions for current logged in user.
3. Tap the [buo cask](https://github.com/buo/homebrew-cask-upgrade). This allows you to upgrade brew installed third party apps from CLI or scripts.
4. Install our third party apps. Chrome, Firefox, Dropbox, iTerm, etc..
5. Install [dockutil](https://github.com/kcrawford/dockutil). We'll be able to customize our dock later to have our company apps and links at the bottom.
6. 
