# Игнорирование файлов в Git (.gitignore)

В любом проекте есть файлы, которые **не должны попадать в репозиторий**.  
Git решает это с помощью механизма игнорирования.

---

## 🚫 Зачем игнорировать файлы

Основные категории:

- 🏗️ **Сборка** — `dist/`, `build/`, бинарники  
- 📦 **Зависимости** — `node_modules/`, `vendor/`  
- 🧪 **Временные файлы** — `.tmp`, `.log`, `.swp`  
- ⚙️ **Локальные настройки** — `.env`, конфиги IDE  
- 🔐 **Секреты** — API-ключи, пароли  

📌 Иначе:
- растёт размер репозитория  
- появляются конфликты  
- возможны утечки данных  

---

## 📄 Файл `.gitignore`

Содержит правила игнорирования файлов и папок.

### Пример:
```bash id="p4a9cd"
node_modules/
dist/
build/

*.log
*.tmp

.env
config/local.json

.vscode/
.idea/

📌 Обычно находится в корне проекта

🧩 Синтаксис
# Комментарий
*.log          # все .log файлы
build/         # папка build
/TODO          # только в корне
**/temp        # temp везде
doc/*.txt      # только в doc/
doc/**/*.pdf   # pdf во всех вложенных папках

!important.log # исключение
Основные правила:
* — любое количество символов
? — один символ
** — вложенные папки
/ в начале — от корня
/ в конце — директория
! — отмена игнорирования
⚙️ Как использовать
echo "node_modules/" > .gitignore
git add .gitignore
git commit -m "Add .gitignore"

📌 После этого файлы перестанут показываться в git status

⚠️ Важно

.gitignore не влияет на уже отслеживаемые файлы

👉 Нужно удалить их из индекса:

git rm --cached filename.log
git commit -m "Remove file"

Для папок:

git rm -r --cached node_modules/
📁 Несколько .gitignore

Можно использовать в разных папках:

project/
├── .gitignore
├── src/.gitignore
└── tests/.gitignore

📌 Правила действуют:

на текущую папку
и все вложенные
🌍 Глобальный .gitignore

Для файлов, которые игнорируются во всех проектах:

git config --global core.excludesfile ~/.gitignore_global

Пример:

.DS_Store
Thumbs.db
*.swp
📂 Пустые папки — .gitkeep

Git не отслеживает пустые директории.

👉 Решение — добавить файл:

logs/.gitkeep

Создание:

mkdir -p logs temp
touch logs/.gitkeep temp/.gitkeep

📌 .gitkeep — просто соглашение

🧪 Проверка игнорирования
# Проверить файл
git check-ignore -v file.log

# Все игнорируемые
git status --ignored
📚 Примеры шаблонов
Python
__pycache__/
*.py[cod]
venv/
dist/
build/
.pytest_cache/
Java
*.class
*.jar
target/
build/
.idea/
Web
node_modules/
dist/
*.log
.env
.vscode/
💡 Лучшие практики
Добавляй .gitignore сразу
Используй готовые шаблоны (gitignore.io)
Комментируй нестандартные правила
❗ Не игнорируй важные файлы проекта
🧠 Итог

.gitignore помогает:

держать репозиторий чистым
избегать конфликтов
защищать данные

📌 Правило:

В репозитории только то, что нужно для проекта
