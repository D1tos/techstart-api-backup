# Ветки в удаленных репотизориях
## Как Git отслеживает удаленные ветки
### Remote-tracking ветки
Ключевой элемент. Хранятся в вашем локальном репозитории, 
но не можете их изменить напрямую.
Их задача - запоминать состояние веток на удаленном сервере на момент синхронизации

#### Структура имён remote-tracking веток
origin/main          # ветка main на remote origin
origin/feature/auth  # ветка feature/auth на remote origin
upstream/develop     # ветка develop на remote upstream

Эти ветки обновляются автоматически при выполнении fetch pull push
служат якорями относительно которых определяет,
насколько локальные ветки расходятся с удалёнными

## Жизненный цикл remote-tracking веток
При клонировании создаются remote-tracking ветки для всех веток удалённого репозитория
При fetch существующие remote-tracking ветки обновляются, новые создаются
При push соответствующая remote-tracking ветка обновляется после успешной отправки
Remote-tracking ветки остаются даже если удалённая ветка удалена (до выполнения prune)

## Создание и публикация веток
создание ветки - локальная операция.
для работы команды - опубликуй в удаленном репозитории
### Первая публикация ветки
Содаем локально, в удаленном репо ее не существует:
#### Создание локальной ветки
$ git checkout -b feature/payment-integration
#### Попытка push без указания remote и ветки
$ git push
fatal: The current branch feature/payment-integration has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin feature/payment-integration

Нужно явно указать remote и имя ветки:
#### Публикация с установкой upstream связи
$ git push -u origin feature/payment-integration

#### Что происходит:
##### 1. Создаётся ветка feature/payment-integration на сервере
##### 2. Отправляются все коммиты этой ветки
##### 3. Создаётся remote-tracking ветка origin/feature/payment-integration
##### 4. Устанавливается upstream связь между ветками

## Почему важна связь upstream
После усановки upstream git запонимает соотвествие между ветками. Преимущества:
-Короткие команды (git push, git pull) работают без дополнительных параметров
-git status показывает состояние синхронизации
-git branch -vv отображает связи между ветками
-Git предупреждает о расхождениях перед потенциально опасными операциями

### Проверка upstream связей
$ git branch -vv
  main                        4a5b6c7 [origin/main] Latest changes
* feature/payment-integration 8d9e0f1 [origin/feature/payment-integration] Add payment API
  feature/refactoring        2b3c4d5 Refactor user service  # нет upstream!

## Получение и отслеживание удалённых веток
Процесс получения удалённых веток требует явных действий

### Обнаружение новых удалённых веток
#### Получение информации о всех ветках
$ git fetch origin

#### Просмотр всех remote-tracking веток
$ git branch -r
  origin/main
  origin/develop
  origin/feature/new-design  # новая ветка от коллеги
  origin/hotfix/security-patch

После fetch у вас есть remote-tracking ветка origin/feature/new-design, 
но нет локальной ветки для работы

### Создание локальной ветки из удалённой
#### Способ 1: checkout с автоматическим созданием
$ git checkout feature/new-design
#### Git автоматически создаст локальную ветку, отслеживающую origin/feature/new-design
#### Способ 2: явное создание с указанием upstream
$ git checkout -b feature/new-design origin/feature/new-design
#### Способ 3: создание с другим именем
$ git checkout -b my-design-work origin/feature/new-design

Первый способ работает благодаря "догадливости" Git
 — если локальной ветки с таким именем нет, 
но есть единственная remote-tracking ветка с таким именем, 
Git автоматически создаст локальную ветку с правильной upstream связью.

## Удаление веток
### Удаление локальных веток
#### Безопасное удаление (только если ветка полностью слита)
$ git branch -d feature/completed-task
#### Принудительное удаление
$ git branch -D feature/abandoned-feature

Удаляет только локальную ветку. Remote-tracking и удалённые ветки остаются

### Удаление удалённых веток
#### Современный синтаксис
$ git push origin --delete feature/old-feature

#### Старый синтаксис (всё ещё работает)
$ git push origin :feature/old-feature

#### Что происходит:
##### 1. Ветка удаляется на сервере
##### 2. Remote-tracking ветка НЕ удаляется автоматически

Синтаксис с двоеточием означает 
"push ничего (пустоту) в feature/old-feature", 
что интерпретируется как удаление.

### Очистка remote-tracking веток
После удаления веток на сервере, remote-tracking ветки остаются в вашем репозитории как "призраки":
#### Просмотр "мёртвых" remote-tracking веток
$ git remote prune origin --dry-run
Pruning origin
 * [would prune] origin/feature/deleted-feature
 * [would prune] origin/hotfix/old-fix

#### Фактическое удаление
$ git remote prune origin
#### Или автоматическая очистка при fetch
$ git fetch --prune origin
Можно настроить автоматическую очистку:
$ git config remote.origin.prune true

## Работа с ветками нескольких remote
### Пространства имён remote-tracking веток
Каждый remote имеет своё пространство имён для веток:
$ git branch -r
  origin/main
  origin/develop
  origin/feature/auth
  upstream/main
  upstream/develop
  upstream/feature/auth
  backup/main

Даже если ветки называются одинаково, Git различает их по префиксу remote. 
Это позволяет отслеживать состояние одной логической ветки в разных репозиториях.

### Синхронизация между remote
Обновление форка из оригинального репозитория
#### 1. Получить изменения из upstream
$ git fetch upstream
#### 2. Обновить локальную main из upstream
$ git checkout main
$ git merge upstream/main
#### 3. Отправить обновления в свой fork
$ git push origin main
#### Результат: main синхронизирована между upstream, локальным репо и origin

### Сравнение веток разных remote
#### Что есть в upstream, но нет в origin
$ git log origin/main..upstream/main
#### Различия между ветками разных remote
$ git diff origin/develop upstream/develop
#### Визуальное сравнение
$ git log --graph --oneline origin/main upstream/main

## Стратегии именования и организации веток
Подходы
### Префиксы по типу
помогают организовтаь ветки
-feature/ — новая функциональность
-bugfix/ — исправления багов
-hotfix/ — срочные исправления
-release/ — подготовка релизов
### Включение номера задачи 
упрощают отслеживание
-feature/JIRA-123-user-authentication
-bugfix/GH-456-fix-memory-leak

## Защита веток на сервере
настраивабт правила для веток
    Защита от удаления — критические ветки нельзя удалить
    Защита от force push — сохранение истории
    Требование pull request — изменения только через review
    Автоматические проверки — CI/CD перед слиянием
Эти настройки выполняются через веб-интерфейс хостинга, 
но важно понимать, как они влияют на работу с Git.

## Диагностика проблем с ветками
### Ветка существует удаленно, но не видна локально
#### Обновить информацию о ветках
$ git fetch origin
#### Если ветка всё ещё не видна, проверить настройки fetch
$ git config remote.origin.fetch
+refs/heads/*:refs/remotes/origin/*  # должно быть так 

### Push отклоняется для новой ветки
#### Проверить права доступа
$ git ls-remote origin  # должен показать список веток
#### Проверить naming conventions
#### Некоторые серверы запрещают определённые имена веток 

### Remote-tracking ветка остает
#### Принудительное обновление конкретной ветки
$ git fetch origin feature/specific-branch:remotes/origin/feature/specific-branch
