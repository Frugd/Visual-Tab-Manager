# Visual Tab Manager

Visual Tab Manager is a Firefox WebExtension for switching between tabs using captured previews of page elements.

## Features

- Pick a CSS selector directly from the current page.
- Capture element previews for open tabs and reuse them inside a visual manager.
- Filter previews by domain and search by title or URL.
- Choose between `English` and `Russian` in the settings.
- Use `mrrobot`, `dark`, or `light` themes. `mrrobot` is the default theme.
- Open the manager in a tab or popup window.
- Optionally enable auto capture for all sites at runtime.

## Permissions

- `activeTab`: used for manual picking and manual capture on the active page.
- `tabs`: used to enumerate tabs and switch to the selected tab.
- `storage`: used to keep selectors, settings, and captured previews.
- `scripting`: used to inject the picker and register or unregister the optional auto-capture content script.
- `optional_host_permissions: ["<all_urls>"]`: requested only when the user enables auto capture.

## Privacy

- No analytics, telemetry, advertising, or affiliate logic.
- No remote code loading.
- No third-party requests are required for normal operation.
- Captured previews and settings are stored locally in the browser.

See [PRIVACY.md](./PRIVACY.md) for the privacy summary used for publication.

## Development

There is no build step. The repository contents are the extension sources.

To load the extension temporarily in Firefox:

1. Open `about:debugging#/runtime/this-firefox`.
2. Click `Load Temporary Add-on`.
3. Select the repository `manifest.json`.

## Packaging

Zip the repository contents directly. Do not include `.git`, local IDE metadata, or the outer workspace directory.

## AMO review notes

See [AMO-REVIEW.md](./AMO-REVIEW.md).
