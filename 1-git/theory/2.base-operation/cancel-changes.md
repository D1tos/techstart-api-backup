# Отмена изменений в Git

В процессе разработки часто нужно **откатить изменения**.  
Git предоставляет несколько инструментов под разные сценарии.

---

## 🧠 Эволюция команд

Раньше использовалась универсальная команда:

```bash
git checkout

С версии Git 2.23+ появились более понятные команды:

git restore — восстановление файлов
git switch — переключение веток

📌 Старые команды всё ещё работают, но считаются устаревающими

🔄 Восстановление файлов — git restore

Основной современный инструмент для отмены изменений.

✏️ Отмена изменений в рабочей директории
# Один файл
git restore README.md

# Несколько файлов
git restore file1.txt file2.txt

# Папка
git restore src/

# Всё
git restore .

⚠️ Важно:

Все изменения будут безвозвратно удалены

📦 Убрать изменения из индекса (staging)
# Убрать файл из индекса
git restore --staged README.md

# Убрать всё из индекса
git restore --staged .

# Полный откат (и индекс, и файлы)
git restore --staged --worktree README.md

📌 При этом изменения остаются в рабочей директории (если не указан --worktree)

🕓 Восстановление из другого коммита
# Из предыдущего коммита
git restore --source=HEAD~2 README.md

# Из другой ветки
git restore --source=feature-branch config.json

# Восстановить удалённый файл
git restore --source=HEAD~1 deleted-file.txt
🧾 Старый способ — git checkout
# Отмена изменений
git checkout -- README.md

# Из конкретного коммита
git checkout HEAD~2 -- README.md

# Всё
git checkout -- .

📌 -- отделяет файлы от параметров

🧹 Удаление неотслеживаемых файлов — git clean

Удаляет файлы, которые Git не отслеживает:

# Предпросмотр (обязательно!)
git clean -n

# Удалить файлы
git clean -f

# Удалить файлы и папки
git clean -fd

# Удалить включая игнорируемые
git clean -fx

# Интерактивный режим
git clean -i

⚠️ Важно:

git clean удаляет файлы навсегда

🎯 Типичные сценарии
1. Отменить изменения в файле
git restore src/main.js
2. Убрать файл из staging
git restore --staged .env
3. Полный сброс проекта
git restore .
git restore --staged .
git clean -fd
4. Восстановить удалённый файл
git restore --source=<commit> deleted-file.txt
⚖️ Разница между командами
Команда	Что делает
git restore	Восстанавливает отслеживаемые файлы
git checkout	Старый способ (аналог restore)
git clean	Удаляет неотслеживаемые файлы
⚠️ Меры предосторожности

Перед отменой изменений:

🔍 Проверяй состояние
git status
git diff
💾 Делай резервную копию
# Временное сохранение
git stash push -m "backup"

# Или временная ветка
git checkout -b temp-backup
git add .
git commit -m "backup"
git checkout main
💡 Итог

Отмена изменений = разные инструменты под разные задачи:

restore → откат файлов
clean → удаление мусора
checkout → legacy

📌 Главное правило:

Всегда проверяй изменения перед откатом
