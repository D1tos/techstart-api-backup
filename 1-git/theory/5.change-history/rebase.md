# Rebase: линейная история

## 📌 Ключевая идея
`git rebase` — это способ **переписать историю**, чтобы она выглядела линейной.

> Вместо merge-коммита Git **переносит ваши коммиты на новую базу**

---

## 🧠 Зачем нужен rebase

### Проблема
```text
      C---D---E (feature)
     /
A---B---F---G---H (main)

👉 Ваша ветка устарела

Решение через rebase
A---B---F---G---H (main)
                 \
                  C'---D'---E' (feature)

👉 История становится линейной и чистой

⚙️ Как работает rebase
git checkout feature
git rebase main
Что происходит:
Git находит общий коммит (B)
Сохраняет изменения (C, D, E)
Перемещает ветку на main
Применяет коммиты заново → C' D' E'
❗ Важно
Коммиты пересоздаются
Меняется SHA-1 хеш
Это новая история
🔧 Базовое использование
git checkout feature/my-branch
git rebase main
⚔️ Конфликты при rebase

Если возник конфликт:

git add file.js
git rebase --continue
Дополнительно:
git rebase --skip    # пропустить коммит
git rebase --abort   # отменить всё

👉 Конфликты решаются по одному коммиту

📊 Rebase vs Merge
Merge (шумная история)
*   Merge branch 'feature'
|\
| * Work
* | Fix
|/
Rebase (чисто)
* Work
* Fix
✅ Преимущества rebase
📖 Читаемая история
🔍 Проще дебажить (git bisect)
🧹 Чистые pull request
🚀 Нет лишних merge-коммитов
⚠️ Золотое правило

❗ Никогда не делай rebase после push

Почему:
У вас:
A---B---C'

У коллег:
A---B---C

👉 История ломается → конфликты и хаос

✅ Когда можно использовать
локальные ветки
feature-ветки до push
работа в одиночку
🔁 Rebase vs Merge: когда что
Используй rebase:
обновить feature-ветку
перед pull request
для чистоты истории
Используй merge:
публичные ветки
командная работа
если не уверен
🚀 Рекомендуемый workflow
git checkout feature
git fetch origin
git rebase origin/main
git push
🔄 Pull с rebase
git pull --rebase

👉 альтернатива обычному pull

Сделать по умолчанию:
git config --global pull.rebase true
🛟 Восстановление через reflog
git reflog
git reset --hard HEAD@{N}

👉 можно откатиться до состояния до rebase

🧩 Backup перед rebase
git branch backup/my-branch
git rebase main
🧠 Кратко
rebase = перенос коммитов
делает историю линейной
переписывает hash
❗ не использовать после push
идеален для чистых feature-веток
