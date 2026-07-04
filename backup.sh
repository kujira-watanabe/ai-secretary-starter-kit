#!/usr/bin/env bash
# AI秘書プロジェクトのバックアップ（安全版：バックアップ先のファイルは消さない）
# 使い方: ./backup.sh
set -euo pipefail

# このスクリプトが置いてあるフォルダ（＝秘書プロジェクト）をバックアップ元にする
SOURCE="$(cd "$(dirname "$0")" && pwd)/"

# バックアップ先（Windowsの場合: Dドライブ。Macの場合は例を参考に書き換える）
DESTINATION="/mnt/d/AI-secretary-backup/"
# Macの例: DESTINATION="$HOME/Backups/ai-secretary/"

if [ ! -d "$(dirname "$DESTINATION")" ] && [ ! -d /mnt/d ]; then
  echo "バックアップ先が見つかりません。backup.sh の DESTINATION を編集してください。"
  exit 1
fi

mkdir -p "$DESTINATION"
rsync -a "$SOURCE" "$DESTINATION"

echo "バックアップ完了: $DESTINATION"
echo "（元で削除したファイルもバックアップ側には残る安全設定です）"
