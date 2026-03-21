# Игнорирование файлов (.gitignore .gitkeep)
Файлы, которые не должнв попадать в систему VCS.
Механизм для исключения

## Зачем игнорировать файлы
### Результаты сборки и компиляции
файлы,генерируемые из исходного кода (бинарные файлы, минифицированный код)
### Зависимости
Внешние библиотеки, устанавливаемые менеджерами пакетов
### Временные файлы
кэш, логи,  файлы редакторов
### Локальная конфигурация
настройки среды разроботки, специичные для каждого разработчика
### Конфиденциальные данные
пароли, ключи API, сертификаты

Включение таких файлов в репозиторий приводит к раздуванию размера
конфликтам при слиянии и потенциальным проблемам безопасности.

## Файл .gitignore
Содержит шаблоны имен файло и директорий, которые git должен игнорировать
Расположение обычно в корне репозитория, но может находится в любой поддиректории

## Синтаксис шаблонов
glob-шаблоны для определения игнорируемых файлов:

#### Комментарий - строки, начинающиеся с #, игнорируются
#### Игнорировать все файлы с расширением .log
*.log
#### Игнорировать все файлы в директории build
build/
#### Игнорировать файл TODO в корне репозитория, но не subdir/TODO
/TODO
#### Игнорировать все файлы в любой директории temp
**/temp
#### Игнорировать doc/notes.txt, но не doc/server/notes.txt
doc/*.txt
#### Игнорировать все .pdf файлы в директории doc/ и её поддиректориях
doc/**/*.pdf
#### НЕ игнорировать файл important.log, даже если *.log игнорируется
!important.log

Основные правила синтаксиса:

	* — соответствует любому количеству символов (кроме /)
	? — соответствует одному символу
	[abc] — соответствует любому символу из набора
	** — соответствует вложенным директориям
	/ в начале — привязка к корню репозитория
	/ в конце — указание на директорию
	! в начале — отмена игнорирования

## Работа с .gitignore
### Создание и применение
создается как обычный текстовый файл и должен быть добавлен репозиторий
$ echo "node_modules/" > .gitignore
$ echo "*.log" >> .gitignore
$ git add .gitignore
$ git commit -m "Add .gitignore"

### Важное замечание
.gitignore влияет только не неотслеживаемые файлы. если добавлен в репозиторий,добавление в .gitignore не приведет к удалению из git.
Нужно удалить из индекса:

#### Удалить файл из репозитория, но оставить в рабочей директории
$ git rm --cached filename.log
$ git commit -m "Remove accidentally committed log file"

#### Для директории
$ git rm -r --cached node_modules/
$ git commit -m "Remove node_modules from tracking"

## Множественные файлы .gitignore
В проекте может быть несколько .gitignore
Правила применяются к директории, содержащей .gitignore, и всем её поддиректориям. 
Более специфичные правила имеют приоритет над общими.

## Глобальный .gitignore
Использутеся для файлов, которые будут игнорированы во всех проектах
#### Настройка глобального .gitignore
$ git config --global core.excludesfile ~/.gitignore_global

#### Создание файла
$ echo ".DS_Store" > ~/.gitignore_global
$ echo "Thumbs.db" >> ~/.gitignore_global
$ echo "*.swp" >> ~/.gitignore_global 

влияют на репозмтория пользователя,не влияют на других разработчиков проекта

## Сохраненме пустых директорий .gitkeep
если важна структура 
Создание структуры с пустыми директориями:
$ mkdir -p logs temp uploads
$ touch logs/.gitkeep temp/.gitkeep uploads/.gitkeep
$ git add .
$ git commit -m "Add directory structure"

## Типичные шаблоны .gitignore
### Python
# Byte-compiled files
__pycache__/
*.py[cod]
*$py.class

# Virtual environment
venv/
env/
ENV/

# Distribution
dist/
build/
*.egg-info/

# Testing
.pytest_cache/
.coverage
htmlcov/

# IDE
.vscode/
.idea/
*.sublime-project

### Java
# Compiled files
*.class
*.jar
*.war
*.ear

# Build directories
target/
build/
out/

# IDE files
.idea/
*.iml
.eclipse
.project
.classpath

# OS files
.DS_Store
Thumbs.db

### Web
# Dependencies
node_modules/
bower_components/

# Build output
dist/
build/
.tmp/

# Logs
*.log
npm-debug.log*
yarn-debug.log*

# Environment variables
.env
.env.*

# Editor directories
.idea/
.vscode/
*.swp
*.swo

## Проверка игнорируемых файлов
##### Проверить, игнорируется ли конкретный файл
$ git check-ignore -v filename.log
.gitignore:3:*.log    filename.log

##### Показать все игнорируемые файлы в директории
$ git status --ignored

##### Показать все игнорируемые файлы с деталями
$ git status --ignored -v

## Лучшие практики
### Добавлять .gitignore в начале проекта
### Использовать шаблоны из gitignor.io
### Документировать нестандартные правила
### Не игронировать важные файлы
