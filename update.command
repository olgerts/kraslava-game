#!/bin/bash
set -e

cd "$(dirname "$0")"

echo ""
echo "🎮 KRĀSLAVA GAME — обновление"
echo "--------------------------------"

# Проверяем Git
if ! command -v git >/dev/null 2>&1; then
  echo "❌ Git не установлен."
  echo "Установи Xcode Command Line Tools и запусти этот файл снова."
  read -p "Нажми Enter..."
  exit 1
fi

# Если папка ещё не является Git-репозиторием — подключаем её
if [ ! -d ".git" ]; then
  echo "📦 Подключаю папку к GitHub..."
  git init
  git branch -M main
  git remote add origin https://github.com/olgerts/kraslava-game.git
fi

# На случай, если remote уже существует, исправляем его
git remote set-url origin https://github.com/olgerts/kraslava-game.git

echo "⬆️ Загружаю изменения на GitHub..."
git add .
git commit -m "Update game $(date '+%Y-%m-%d %H:%M')" || true
git push -u origin main

echo ""
echo "✅ ГОТОВО!"
echo "Игра обновится через некоторое время:"
echo "https://olgerts.github.io/kraslava-game/"
echo ""
read -p "Нажми Enter для выхода..."
