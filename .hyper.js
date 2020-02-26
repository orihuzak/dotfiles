// hyper terminal setting file

module.exports = {
  "config": {
    fontSize: 11,
    // フォントの設定
    fontFamily: '"HackGen Console", "Source Han Code JP R", "DroidSansMono Nerd Font"',
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
