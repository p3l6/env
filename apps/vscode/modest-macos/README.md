# Modest-macOS Theme for VSCode

A simple vscode theme with a similar vibe to Xcode and the macOS system.

The main goal is not only to match Xcode's syntax colors, but the approximate scopes for which the colors apply.
This includes attempting to mimic Xcodes differentiation between project defined types/functions and SDK defined types/functions.

## Additional Recommended settings:

```json
"editor.semanticHighlighting.enabled": true,
"editor.minimap.renderCharacters": false,
"editor.stickyScroll.enabled": true,
"explorer.sortOrder": "mixed",
"window.autoDetectColorScheme": true,
"workbench.activityBar.location": "top",
"workbench.colorTheme": "Modest macOS - Light",
"workbench.preferredLightColorTheme": "Modest macOS - Light",
"workbench.preferredDarkColorTheme": "Modest macOS - Dark",
"workbench.editor.tabActionLocation": "left",
"workbench.editor.highlightModifiedTabs": true,
```

## TODO

- [ ] Update for true [semantic highlighting](https://code.visualstudio.com/api/language-extensions/semantic-highlight-guide) support. Remove force from recommended settings above.
- [ ] Add file icon placeholders; with script to export and replace them from sfsymbols.app after install
- [ ] Add product icons in the same way
