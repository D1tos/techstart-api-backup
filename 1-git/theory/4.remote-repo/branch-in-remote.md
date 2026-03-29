🌿 Ветки в удалённых репозиториях

Работа с удалёнными ветками — это не просто push/pull, а система:

отслеживания изменений
синхронизации
координации команды
🧠 Как Git работает с удалёнными ветками

Git использует 3 уровня веток:

🔹 Локальные
main, feature/auth
рабочие ветки
🔹 Remote-tracking
origin/main, origin/feature/auth
❗ только для чтения
отражают состояние сервера
🔹 Удалённые
находятся на сервере
доступны только через синхронизацию
git branch -a
🔗 Remote-tracking ветки
Что это:
локальные "снимки" удалённых веток
обновляются автоматически
Примеры:
origin/main
origin/feature/auth
upstream/develop
Когда обновляются:
git fetch
git pull
git push
🚀 Публикация ветки (первый push)

Создание ветки — локально:

git checkout -b feature/payment

Первый push:

git push -u origin feature/payment
Что происходит:
создаётся ветка на сервере
отправляются коммиты
создаётся origin/feature/payment
настраивается upstream
🔗 Upstream связь

Связывает:

локальная ветка ↔ удалённая ветка
Даёт:
короткие команды (git push, git pull)
статус синхронизации
предупреждения
git branch -vv
📥 Получение новых веток
git fetch origin
git branch -r
Создание локальной ветки:
Автоматически:
git checkout feature/new-design
Явно:
git checkout -b feature/new-design origin/feature/new-design
🗑 Удаление веток
Локально:
git branch -d feature/task
git branch -D feature/task  # принудительно
Удалённо:
git push origin --delete feature/task
Очистка "мёртвых" веток:
git remote prune origin

или:

git fetch --prune
🌍 Работа с несколькими remote

Пример:

origin — твой репозиторий
upstream — оригинал
git branch -r
origin/main
upstream/main
🔄 Синхронизация fork
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
🔍 Сравнение веток
git log origin/main..upstream/main
git diff origin/main upstream/main
🧩 Именование веток

Рекомендуемые префиксы:

feature/ — новая функция
bugfix/ — баг
hotfix/ — срочно
release/ — релиз

Примеры:

feature/JIRA-123-auth
bugfix/GH-45-memory-leak
🔒 Защита веток (на сервере)

Обычно настраивается в GitHub/GitLab:

запрет удаления
запрет force push
обязательный pull request
CI/CD проверки
🛠 Частые проблемы
❌ Ветка не видна
git fetch origin
❌ Remote-tracking устарел
git fetch --prune
❌ Push не работает
git ls-remote origin
💡 Коротко
origin/* — состояние сервера
git fetch — обновить информацию
git push -u — создать ветку + связать
git prune — убрать мусор
