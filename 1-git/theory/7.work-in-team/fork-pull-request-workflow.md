# Fork и Pull Request Workflow

## 📌 Коротко
**Fork + Pull Request** — это безопасная модель работы с репозиторием, где:
- каждый работает в своей копии (fork)
- изменения предлагаются через Pull Request (PR)
- только maintainer'ы решают, что попадёт в основной репозиторий

👉 Стандарт для open source и крупных команд

---

## 🧠 Fork vs Clone

| | Fork | Clone |
|--|------|------|
| Где создаётся | На сервере (GitHub и т.д.) | Локально |
| Права | Полный контроль | Зависит от доступа |
| Связь с оригиналом | Через платформу | Через remote |
| Использование | Контрибьютинг | Обычная работа |

---

## 🔄 Общий процесс

1. Сделать fork репозитория
2. Клонировать fork локально
3. Добавить `upstream`
4. Создать feature-ветку
5. Сделать изменения
6. Запушить в fork
7. Создать Pull Request
8. Пройти review → merge

---

## ⚙️ Настройка

### Клонирование fork

```bash
git clone git@github.com:yourusername/project.git
cd project
Добавление upstream
git remote add upstream git@github.com:originalowner/project.git
git remote -v

👉 origin — твой fork
👉 upstream — оригинальный репозиторий

🔄 Синхронизация с оригиналом
git fetch upstream
git checkout main
git merge upstream/main
git push origin main

👉 Делай это перед началом работы

🌿 Работа с фичами
Создание ветки
git checkout -b feature/my-feature
Коммит и push
git add .
git commit -m "Add new feature"
git push origin feature/my-feature
🚀 Pull Request

PR — это запрос на добавление изменений в оригинальный репозиторий.

Хороший PR содержит:
понятный заголовок
описание "что и зачем"
ссылку на issue
чеклист/скриншоты (если нужно)
🔁 Обновление PR
После ревью
git add .
git commit -m "Fix review comments"
git push origin feature/my-feature

👉 PR обновится автоматически

⚔️ Разрешение конфликтов
git fetch upstream
git checkout feature/my-feature
git rebase upstream/main

# решить конфликты
git add .
git rebase --continue

git push --force-with-lease

👉 Используй rebase, чтобы сохранить чистую историю

🧹 Очистка после merge
git branch -d feature/my-feature
git push origin --delete feature/my-feature
git remote prune origin
💡 Лучшие практики
1. Маленькие PR
Один PR = одна задача
Проще ревью → быстрее merge
2. Не работай в main

Всегда создавай отдельную ветку

3. Делай self-review

Перед PR:

код работает
нет мусора
тесты проходят
4. Коммуникация
отвечай на комментарии
объясняй решения
будь вежливым 🙂
🏢 В командах

В компаниях часто:

обязательные PR для всех изменений
защищённые ветки (main нельзя пушить)
автоматические проверки (CI/CD)
🔀 Альтернативы
Feature Branch workflow — без fork, но с ветками
Gitflow — сложная схема с релизами
GitHub Flow — упрощённый вариант
🧠 Главное
Fork = твоя безопасная копия
PR = способ предложить изменения
Review = контроль качества

👉 Это стандартный и самый безопасный способ совместной разработки
