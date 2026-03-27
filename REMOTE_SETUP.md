# Remote Repository Setup

## Current Remotes
backup	https://github.com/D1tos/techstart-api-backup (fetch)
backup	https://github.com/D1tos/techstart-api-backup (push)
origin	https://github.com/D1tos/techstart-api (fetch)
origin	https://github.com/D1tos/techstart-api-backup (push)

## Tracking Branches
  develop 8404801 Update version to 1.1.0-dev
* master  82ee504 [backup/master: ahead 3] Merge health and metrics endpoints

## Fork Workflow Summary
- Original repository: https://github.com/D1tos/awesome-calculator
- Fork repository: https://github.com/Inq-Inc/calculator-fork
- Upstream configuration: git remote add upstream https://github.com/D1tos/awesome-calculator

## Backup Strategy
- Primary remote: origin
- Backup remote: backup
- Sync command: git push origin master

## Lessons Learned
В процессе работы с удаленными репозиториями я освоил:
1. Fork workflow и синхронизацию с upstream через fetch/merge
2. Настройку нескольких remote для резервного копирования
3. Управление удаленными ветками: создание, отслеживание, удаление
4. Разрешение конфликтов при синхронизации
5. Настройку push в несколько репозиториев одновременно

Ключевое понимание: для работы с форком важно правильно настроить upstream, а для корпоративных проектов полезно иметь backup remote с автоматической синхронизацией через push URL.
