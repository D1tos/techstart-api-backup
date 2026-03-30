# Интерактивный rebase: squash, reorder, edit

Интерактивный rebase (`git rebase -i`) — инструмент для **переписывания истории коммитов**: объединения, изменения порядка, редактирования и удаления коммитов.

Используется для приведения истории к чистому и понятному виду перед публикацией.

---

## 🚀 Быстрый старт

```bash
# Изменить последние 3 коммита
git rebase -i HEAD~3

# Все коммиты относительно main
git rebase -i main

После запуска откроется список коммитов:

pick f7f3f6d Commit 1
pick 310154e Commit 2
pick a5f4a0d Commit 3

Git выполнит команды сверху вниз.

🧠 Основные команды
Команда	Что делает
pick	оставить как есть
reword	изменить сообщение
edit	изменить содержимое
squash	объединить с предыдущим
fixup	объединить (без сохранения сообщения)
drop	удалить коммит
🔗 Squash (объединение коммитов)
Пример

Было:

WIP commit
Fix bug
Add tests
git rebase -i HEAD~3
pick base commit
squash WIP commit
squash Fix bug
squash Add tests
Результат:

👉 Один чистый коммит вместо нескольких

⚖️ squash vs fixup
squash — объединяет и даёт отредактировать сообщение
fixup — объединяет и удаляет сообщение
pick base
fixup WIP
fixup fix typo

👉 Останется только сообщение base

🔄 Reorder (изменение порядка)

Просто меняем строки местами:

pick Add model
pick Add migration
pick Add controller

👉 Git применит коммиты в новом порядке

⚠️ Осторожно:

порядок может сломать зависимости
возможны конфликты
✏️ Edit (редактирование коммита)
pick commit1
edit commit2
pick commit3

Git остановится:

# меняем файлы
git add .

# переписываем коммит
git commit --amend

# продолжаем
git rebase --continue
✂️ Разделение коммита
git reset HEAD^

Дальше:

git add file1
git commit -m "part 1"

git add file2
git commit -m "part 2"

git rebase --continue
📝 Reword (изменение сообщения)
reword f7f3f6d Fix autentication

👉 откроется редактор → меняем текст

❌ Drop (удаление коммита)
drop 310154e Debug logs

👉 коммит исчезнет из истории

⚙️ Дополнительные возможности
Выполнение команд
pick commit1
exec npm test
pick commit2

👉 Git выполнит команду между шагами

Остановка (break)
pick commit1
break
pick commit2

👉 пауза в процессе

🧩 Типичные сценарии
Очистка истории

Было:

WIP
Fix
Fix typo
More fixes

Стало:

Add authentication system
Исправление старого коммита
git rebase -i HEAD~5

→ пометить edit → исправить → --continue

⚠️ Важные правила
❗ Никогда не делай rebase опубликованных веток

Если ветка уже отправлена:

у других останется старая история
возникнут конфликты и дубли
✅ Безопасно использовать:
локальные коммиты
feature-ветки до push
перед pull request
🛠 Решение проблем
Конфликт
# исправить файл
git add .

git rebase --continue
Отмена
git rebase --abort
Восстановление
git reflog
git reset --hard HEAD@{n}
⚡ Autosquash (ускорение работы)
git commit --fixup=HEAD
git rebase -i --autosquash main

👉 Git сам расставит fixup

💡 Рекомендации
Делай историю чистой и логичной
Каждый коммит = одно осмысленное изменение
Перед push — пройдись rebase
Делай backup перед сложными операциями:
git branch backup/before-rebase
🧾 Итог

Интерактивный rebase — это:

🧹 очистка истории
🧱 сборка логичных коммитов
🧠 контроль над структурой изменений

Если использовать аккуратно — это один из самых мощных инструментов Git.
