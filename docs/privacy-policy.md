# Privacy Policy

Last updated: 2026-04-06

## Summary

Visual Tab Manager stores visual tab previews and user settings inside the browser so you can switch tabs using captured page elements. The extension does not include analytics, ads, remote databases, or third-party tracking.

## What The Extension Stores

- Captured preview thumbnails for tabs
- The tab URL, hostname, title, and capture timestamp associated with each thumbnail
- Domain-specific CSS selectors and optional title keywords used to decide what to capture
- Runtime settings such as theme, language, manager mode, capture delay, and auto-capture preference

## Where Data Is Stored

- `IndexedDB`: captured thumbnails and related tab metadata
- `browser.storage.sync`: per-domain selectors and keyword rules
- `browser.storage.local`: runtime settings

If Firefox Sync is enabled in your browser profile, data kept in `browser.storage.sync` may be synchronized by Firefox between your own signed-in browsers.

## Permissions

The extension requests these permissions:

- `tabs`: read and focus tabs
- `scripting`: inject content scripts for picking and capturing elements
- `storage`: save selectors, rules, thumbnails, and settings
- `activeTab`: interact with the current tab after user action
- Optional host access for `<all_urls>`: enables automatic capture on supported pages

## Data Sharing

Visual Tab Manager does not send captured thumbnails or browsing metadata to the developer. Data remains in your browser unless your browser itself synchronizes `browser.storage.sync` as part of Firefox Sync.

## Contact

If you publish this repository publicly, replace this section with your preferred support or contact channel.
