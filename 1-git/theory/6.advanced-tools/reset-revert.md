# 🔄 Git Reset vs Revert

## 📌 Главное различие

| Команда | Что делает | История |
|--------|-----------|--------|
| `git reset` | Перемещает указатель ветки назад | ❌ Переписывает |
| `git revert` | Создаёт коммит-отмену | ✅ Сохраняет |

👉  
- **reset = удалить коммиты**  
- **revert = отменить через новый коммит**

---

## 🧠 Как это выглядит

```text
# Было
A---B---C---D (main)

# reset --hard B
A---B (main)

# revert C
A---B---C---D---C'
🔧 Git Reset
📍 Что делает
Перемещает HEAD и ветку назад
Может удалить изменения
⚙️ Режимы reset
🟢 --soft
git reset --soft HEAD~1

✔ Коммит удалён
✔ Изменения в staging

👉 Используется для пере-коммита

🟡 --mixed (по умолчанию)
git reset HEAD~2

✔ Коммиты удалены
✔ Изменения в рабочей директории

👉 Используется для переразбиения коммитов

🔴 --hard
git reset --hard HEAD~3

❌ Удаляет ВСЁ:

коммиты
индекс
файлы

⚠️ Опасно

📍 Частые команды
git reset --hard abc123       # к конкретному коммиту
git reset --hard origin/main  # синхронизация
git reset --hard @{u}         # к upstream
⚠️ Когда НЕ использовать reset
в main, develop
после push
если другие работают с веткой
🔁 Git Revert
📍 Что делает

Создаёт новый коммит, который отменяет изменения

🚀 Базовое использование
git revert HEAD
git revert abc123
⚙️ Как работает
берёт изменения коммита
делает их наоборот
создаёт новый коммит
📦 Несколько коммитов
git revert HEAD~3..HEAD
Один коммит вместо нескольких
git revert -n HEAD~3..HEAD
git commit -m "Revert feature"
🔀 Revert merge-коммита
git revert -m 1 <merge-commit>
-m 1 → сохранить main
-m 2 → сохранить feature
⚖️ Когда что использовать
✅ Используй reset если:
коммиты локальные
ещё не сделал push
хочешь переписать историю
чистишь/пересобираешь коммиты
✅ Используй revert если:
изменения уже опубликованы
работаешь в общей ветке
важно сохранить историю
откатываешь старый коммит
🧩 Практические сценарии
🔐 Утекли секреты
# локально
git reset HEAD~1

# если уже push
git revert HEAD

⚠️ Но секреты остаются в истории → нужна ротация

❌ Неудачный merge
# локально
git reset --hard HEAD~1

# в remote
git revert -m 1 HEAD
🧹 Очистка коммитов
git reset --soft HEAD~5
git commit -m "Clean commit"
🆘 Восстановление (reflog)
git reflog
git reset --hard HEAD@{1}

👉 Можно вернуть даже после --hard

Восстановить файл
git checkout HEAD@{1} -- file.js
🧠 Альтернативы
git checkout <commit> -- file.js
git restore --source=HEAD~1 file.js
git clean -fd
⚠️ Правила безопасности
❌ Не делай reset после push
✅ Используй revert в общих ветках
⚠️ Проверяй git status перед --hard
💾 Делай backup ветки
💡 Коротко

reset — переписать историю
revert — отменить безопасно
