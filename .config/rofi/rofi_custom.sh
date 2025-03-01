#!/usr/bin/env bash

set -euCo pipefail

function main() {
  # 表示したい項目と実際に実行するコマンドを連想配列として定義する。
  local -Ar menu=(
    ['poi']='setsid nix develop "$HOME/games/poi" --command bash -c "$HOME/games/poi/poi" > /dev/null 2>&1 & disown'
  )

  local -r IFS=$'\n'
  # 引数があるなら$1に対応するコマンドを実行する。
  # 引数がないなら連想配列のkeyを表示する。
  echo "$@"
  [[ $# -ne 0 ]] && eval "${menu[$1]}" || echo "${!menu[*]}"
}

main $@

