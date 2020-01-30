module.exports = {
  "config": {
    // 透明度の設定
    "opacity": 0.85,
    // 選択範囲をコピーする
    "copyOnSelect": true,
    "cursorBlink": true,
    "cursorShape": "BLOCK",
  },
  "plugins": [
    "hyper-statusline",
    "hyper-search",
    "hyper-opacity",
    "hyper-pane",
    "hyper-tab-icons-plus"
  ],
  "keymaps": {
    "editor:cut": "ctrl+x",
    "editor:copy": "ctrl+c",
    "editor:paste": "ctrl+v",
  }
};
