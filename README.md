# Visual Tab Manager

<p align="center">
  <img src="extension/assets/icons/icon-128.svg" alt="Visual Tab Manager icon" width="96" height="96">
</p>

Visual Tab Manager is a Firefox WebExtension for switching between tabs visually. It lets you choose a page element to capture for each site, stores preview thumbnails locally, and opens a manager view with filtering, search, and restore controls.

## Features

- Visual tab switching with captured page element previews
- Per-domain CSS selector and title keyword rules
- Manager dashboard with search, filtering, pagination, and card size controls
- Optional automatic capture after granting access to all sites
- Theme and language settings (English and Russian)
- Local-first storage: thumbnails in IndexedDB, selectors in `browser.storage.sync`, runtime settings in `browser.storage.local`

## Repository Layout

- `extension/` - extension source code, assets, and Firefox manifest
- `scripts/package-firefox.ps1` - creates a Firefox-ready package in `dist/`
- `.github/workflows/publish-firefox.yml` - GitHub Actions workflow for packaging and AMO publishing
- `release/amo/metadata.template.json` - template for AMO submission metadata
- `docs/privacy-policy.md` - privacy policy for the extension

## Load Locally In Firefox

1. Open `about:debugging#/runtime/this-firefox`.
2. Click `Load Temporary Add-on`.
3. Select `extension/manifests/firefox.json`.

## Package For Firefox

```powershell
pwsh -File scripts/package-firefox.ps1
```

This creates:

- `dist/firefox/` - staged extension files
- `dist/visual-tab-manager-firefox.zip` - packaged archive for signing or distribution

## Publish To AMO With GitHub Actions

1. Copy `release/amo/metadata.template.json` to `release/amo/metadata.json` if you need custom metadata.
2. Add repository secrets `AMO_JWT_ISSUER` and `AMO_JWT_SECRET`.
3. Push a tag such as `firefox-v1.0.0`.

## Privacy

Visual Tab Manager stores captured thumbnails and settings in the browser. It does not ship with analytics or external APIs. Details are in [docs/privacy-policy.md](docs/privacy-policy.md).

## License

This project is licensed under the MPL-2.0. See [LICENSE](LICENSE).
