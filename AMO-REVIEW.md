# AMO Review Notes

## Build

- No build step is required.
- The repository contents are the extension source.
- The submitted package is created directly from these files.

## Runtime permissions

- The extension uses `optional_host_permissions` for `<all_urls>`.
- Access to all sites is requested only when the user enables auto capture.
- When that access is revoked, the auto-capture content script is unregistered.

## Data handling

- All selectors, settings, and thumbnails are stored locally in `browser.storage` or IndexedDB.
- The extension does not transmit captured data to remote services.
- The extension does not load remote code.

## Manual testing

1. Install the extension temporarily in Firefox.
2. Open a page and use the toolbar popup.
3. Click `Pick element` and select a visible element.
4. Confirm that the manager shows a preview card for the tab.
5. Open `Settings` and switch language between `English` and `Russian`.
6. Switch theme between `mrrobot`, `dark`, and `light`.
7. Enable auto capture and confirm Firefox asks for optional access to all sites.
8. Revoke that permission and confirm auto capture stops.
