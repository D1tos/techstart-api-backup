# 🧳 Git Stash

## 📌 Что это
`git stash` — временное хранилище изменений без создания коммита.  
Позволяет **“поставить работу на паузу”**, очистить рабочую директорию и позже вернуть изменения.

---

## ⚙️ Что сохраняется

✅ По умолчанию:
- Изменённые отслеживаемые файлы  
- Изменения в индексе (staged)

❌ Не сохраняется:
- Неотслеживаемые файлы  
- Игнорируемые файлы  

👉 Добавить их можно через:
```bash
git stash -u   # untracked
git stash -a   # включая ignored
🧠 Как это устроено

Stash — это специальные коммиты:

состояние индекса
состояние рабочей директории
(опционально) untracked файлы
🚀 Базовые команды
Сохранить изменения
git stash
git stash push -m "описание"
Восстановить
git stash pop    # применить и удалить
git stash apply  # применить, но оставить

👉 pop = apply + drop

📚 Работа со списком
git stash list              # список
git stash show stash@{0}    # кратко
git stash show -p stash@{0} # полный diff
Управление
git stash apply stash@{1}
git stash drop stash@{1}
git stash clear
🔧 Продвинутые возможности
Частичный stash
git stash -p
Только выбранные файлы
git stash push file1 file2
Сохранить всё кроме staged
git stash push --keep-index
🌿 Создание ветки из stash
git stash branch feature/new stash@{0}

✔ Создаёт ветку
✔ Применяет изменения
✔ Удаляет stash (если без конфликтов)

🧩 Типичные сценарии
🔥 Срочный баг
git stash
git checkout main
# фиксим баг
git checkout feature
git stash pop
🔄 Перенос в другую ветку
git stash
git checkout correct-branch
git stash pop
🧪 Эксперименты
git stash push -m "before experiment"
# эксперимент
git stash pop
⚠️ Конфликты

Если возник конфликт:

git stash pop
# правим файлы
git add .
git stash drop
Проверка заранее
git stash show -p | git apply --check
🗂 Организация stash
Хорошая практика именования
git stash push -m "[WIP] auth"
git stash push -m "[BUG] fix header"
Очистка
git stash list --date=relative
git stash drop stash@{2}
🆘 Восстановление stash
git reflog show stash
git stash store -m "Recovered" <hash>
🔄 Альтернативы
WIP-коммит
Отдельная ветка
git worktree
patch-файлы
💡 Best Practices
Всегда добавляй описание
Используй apply, если не уверен
Чисти старые stash
Проверяй перед применением (show -p)
Для долгой работы — создавай ветку
🧾 Коротко

Stash = быстро убрать изменения → сделать другое → вернуть обратно
