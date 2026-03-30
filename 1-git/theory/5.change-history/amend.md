# Amend и перезапись последнего коммита

## 📌 Ключевая идея
`git commit --amend` — это способ **изменить последний коммит**, но технически:

> ❗ Git **создаёт новый коммит**, заменяя старый

---

## 🧠 Как работает amend

```text
До:
A---B---C (HEAD)

После:
A---B---C'
        ↑
      HEAD
создаётся новый коммит C'
старый C становится недостижимым
меняется SHA-1 хеш
✏️ Изменение сообщения коммита
Быстрое исправление
git commit --amend -m "Correct message"
Через редактор
git commit --amend

👉 Удобно для длинных сообщений

➕ Добавление забытых файлов
git add forgotten-file.js
git commit --amend --no-edit
--no-edit — оставить старое сообщение
новый коммит будет содержать всё вместе
🔧 Исправление кода в коммите
# исправили файл
git add file.js
git commit --amend --no-edit

👉 Используется вместо "fix typo" коммита

🎯 Частичное добавление
git add -p file.js
git commit --amend

👉 Можно добавить только нужные изменения

⚠️ Главное правило

❗ Нельзя делать amend после push

Почему это опасно
У вас:
A---B---C'

У коллеги:
A---B---C

👉 История расходится → конфликты / дубли

✅ Когда amend безопасен
коммит ещё не запушен
feature-ветка (локальная)
git status показывает:
Your branch is ahead of 'origin/main'
🔄 Восстановление через reflog
Посмотреть историю
git reflog
Откатиться назад
git reset --hard HEAD@{1}
🧩 Доступ к старому коммиту
git show <hash>
git branch recovery <hash>

👉 Старый коммит временно сохраняется

🧪 Продвинутые возможности
Изменить автора
git commit --amend --author="Name <email>"
git commit --amend --reset-author
Изменить дату
git commit --amend --no-edit --date="now"
Пересоздать коммит (например, для подписи)
git commit --amend --no-edit -S
🔁 Альтернативы amend
Новый коммит (если уже запушено)
git commit -m "Fix typo"
Изменить несколько коммитов
git rebase -i HEAD~3
Пересобрать коммит
git reset --soft HEAD~1
git commit -m "New message"
🚀 Best practices
✔ Используй amend до push
✔ Полируй коммиты перед публикацией
✔ Проверяй git log перед отправкой
❌ Не переписывай общую историю
🧠 Кратко
amend = замена последнего коммита
меняет историю (hash)
безопасен только локально
мощный инструмент для чистой истории
