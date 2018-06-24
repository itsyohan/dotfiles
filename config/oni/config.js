module.exports = {
  // Do not load defualt config bc it sets 4 spaces as tab
  "oni.useDefaultConfig": false,
  "oni.loadInitVim": true,
  "oni.hideMenu": true,
  "editor.fontLigatures": true,
  "editor.fontSize": "12px",
  "editor.fontFamily": "Fira Code, Menlo",
  "editor.scrollBar.visible": false,
  "editor.quickInfo.enabled": false,
  "editor.errors.slideOnFocus": false,
  "editor.textMateHighlighting.enabled": false,
  "editor.scrollBar.cursorTick.visible": false,
  "tabs.mode": "native",
  "workspace.defaultWorkspace": null,
  "workspace.autoDetectWorkspace": "noworkspace",
  "learning.enabled": false,
  "ui.colorscheme": "solarized-dark",
  "commandline.mode": false,
  "commandline.icons": false,
  "statusbar.enabled": false,
  "sidebar.enabled": false,
  "autoClosingPairs.enabled": false,
  "experimental.markdownPreview.enabled": true,

  // Language support
  'language.javascript.languageServer.command': 'flow-language-server',
  'language.javascript.languageServer.arguments': ['--stdio'],
  "language.rust.languageServer.command": "rustup",
  "language.rust.languageServer.arguments": ["run", "stable", "rls"],
  "language.rust.languageServer.rootFiles": ["Cargo.toml"],
}
