🔄 Синхронизация в Git: fetch, pull, push

Git использует три основные команды для обмена изменениями с удалённым репозиторием:

git fetch — получить изменения (без применения)
git pull — получить и применить
git push — отправить изменения
🧠 Как Git хранит удалённые ветки

В локальном репозитории есть 3 типа веток:

🔹 Локальные ветки
main, develop
Основная рабочая зона
🔹 Remote-tracking ветки
origin/main, origin/develop
Локальные копии удалённых веток
❗ Нельзя изменять напрямую
🔹 Удалённые ветки
Находятся на сервере
Доступны только через синхронизацию
git branch -a
📥 git fetch — безопасное обновление
Что делает:
Загружает изменения с сервера
Обновляет origin/*
❗ НЕ меняет твой код
git fetch origin
После fetch можно:
git log main..origin/main   # что нового на сервере
git diff main origin/main   # различия
Когда использовать:
Перед pull
Перед merge
Чтобы проверить изменения
🔄 git pull — получить и применить
git pull origin main
По сути:
git fetch + git merge

или:

git fetch + git rebase
Варианты поведения:
✅ Fast-forward

Просто сдвигает ветку вперёд (без нового коммита)

🔀 Merge

Создаёт merge-коммит

🔁 Rebase

Переписывает историю (чище, но осторожно)

⚠️ Важно:

pull требует чистой рабочей директории

Ошибка:

Please commit your changes or stash them
📤 git push — отправка изменений
git push origin main
Что делает:
Отправляет локальные коммиты
Обновляет удалённую ветку
❌ Почему push может не сработать

Если на сервере есть новые коммиты:

rejected (non-fast-forward)

👉 Нужно сначала:

git pull
⚠️ Force push (осторожно)
❌ Опасно:
git push --force
Перезаписывает историю
Может удалить чужие коммиты
✅ Безопаснее:
git push --force-with-lease
Проверяет актуальность перед перезаписью
🔗 Upstream (очень важно)

Связывает локальную и удалённую ветку

git push -u origin feature/login

После этого можно писать:

git push
git pull
📊 Статус синхронизации
git status

Возможные состояния:

ahead — есть коммиты для отправки
behind — есть изменения на сервере
diverged — ветки разошлись
✅ Рекомендуемый workflow
git fetch
git pull
git add .
git commit -m "message"
git push
💡 Коротко
fetch → посмотреть изменения
pull → обновить код
push → отправить изменения
