# Reflog и восстановление потерянных данных

## 📌 Коротко
**Reflog** — это локальный журнал всех перемещений указателей (HEAD, веток).  
Позволяет восстановить коммиты после:
- `reset --hard`
- `rebase`
- удаления веток
- неудачного `merge`

👉 Даже если коммит “пропал” — скорее всего он всё ещё есть в Git.

---

## 🧠 Как работает reflog

Каждое действие, меняющее указатель, записывается:
- commit
- checkout
- reset
- merge
- rebase

```bash
git reflog

Пример:

a1b2c3d HEAD@{0}: commit: Add feature
d4e5f6g HEAD@{1}: reset: moving to HEAD~1
Важно:
HEAD@{0} — текущее состояние
HEAD@{1} — предыдущее
reflog локальный (не пушится)
⚡ Быстрое восстановление
Восстановить состояние после reset
git reflog
git reset --hard HEAD@{1}
Восстановить конкретный коммит
git reflog | grep "feature"
git cherry-pick <hash>
Восстановить удалённую ветку
git reflog | grep branch-name
git branch branch-name <hash>
Отменить неудачный rebase
git reflog
git reset --hard HEAD@{5}
Отменить merge
git reflog
git reset --hard HEAD@{1}
🧩 Работа с временем
git show HEAD@{1.hour.ago}
git checkout main@{yesterday}
🔍 Reflog для веток
git reflog show main
git checkout main@{2}
🧨 Когда reflog НЕ поможет
❌ Не сохранённые изменения (без commit / stash)
❌ Старые данные (истек срок хранения)
❌ Данные с другой машины
⏳ Срок хранения

По умолчанию:

90 дней — обычные коммиты
30 дней — недостижимые

Настройка:

git config gc.reflogExpire 180.days
git config gc.reflogExpireUnreachable 90.days
🧪 Продвинутые методы
Найти “потерянные” коммиты
git fsck --lost-found
git show <hash>
git branch recovered <hash>
Посмотреть весь reflog
git reflog --all
🛡️ Лучшие практики
Делай backup-ветку перед опасными операциями:
git branch backup/before-reset
Используй теги для важных состояний
Увеличь срок хранения reflog
Документируй коммиты (легче искать)
💡 Главное
reset не удаляет данные сразу
Git почти никогда ничего не теряет мгновенно
Reflog — твоя “машина времени”

👉 Если что-то сломал — сначала открой git reflog
