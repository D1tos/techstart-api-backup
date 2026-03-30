## 🧠 Как это работает

Cherry-pick **не переносит коммит**, а:

1. Берёт изменения (diff)
2. Применяет их к текущей ветке
3. Создаёт **новый коммит**

```text
Было:
A---B---C  (main)
         \
          G---H  (hotfix)

После cherry-pick H:
A---B---C---H' (main)

👉 H' — новый коммит (другой SHA), но те же изменения

🚀 Базовое использование
# перейти в нужную ветку
git checkout main

# применить коммит
git cherry-pick <commit>

Пример:

git cherry-pick e3b8c91
⚙️ Полезные опции
# без создания коммита
git cherry-pick -n <commit>

# добавить ссылку на оригинал
git cherry-pick -x <commit>

👉 -x добавит в сообщение:

(cherry picked from commit abc123...)
📦 Несколько коммитов
Диапазон
# от A до B (не включая A)
git cherry-pick A..B

# включая A
git cherry-pick A^..B
Несколько коммитов вручную
git cherry-pick abc123 def456 789ghi
⚠️ Конфликты

Если изменения не применяются:

git cherry-pick <commit>

👉 при конфликте:

# исправить файлы
git add .

# продолжить
git cherry-pick --continue

# отменить
git cherry-pick --abort

# пропустить (для диапазона)
git cherry-pick --skip
⚔️ Стратегии слияния
# приоритет изменений из cherry-pick
git cherry-pick -X theirs <commit>

# приоритет текущей ветки
git cherry-pick -X ours <commit>
🎯 Типичные сценарии
🔥 Hotfix в несколько версий
git checkout release/2.0
git cherry-pick main

git checkout release/1.9
git cherry-pick main
🔄 Перенос между feature-ветками
git checkout feature/cart
git cherry-pick c3d4e5f
♻️ Восстановление коммита
git reflog
git cherry-pick <hash>
⚠️ Важная проблема — дубли

Cherry-pick создаёт копию коммита, поэтому:

main:    ---H
feature: ---H'

👉 Git не понимает, что это одно и то же

❗ При merge возможны:

конфликты
дубли изменений
🧩 Продвинутые приёмы
Изменить перед коммитом
git cherry-pick -n abc123

# редактируем файлы
git commit -m "Adapted version"
Merge-коммиты
git cherry-pick -m 1 <merge-commit>
🔍 Диагностика
# какие файлы затронуты
git show --name-only <commit>

# игнорировать пробелы
git cherry-pick -X ignore-space-change <commit>
🔄 Альтернативы
Ситуация	Лучше использовать
Нужна вся ветка	merge
Перенос серии коммитов	rebase
Между репозиториями	format-patch
💡 Рекомендации
Используй -x для отслеживания
Не злоупотребляй (можно сломать историю)
Проверяй перед merge
Подходит для:
hotfix
точечных переносов
восстановления
🧾 Итог

Cherry-pick — это:

🎯 точечный перенос изменений
🔬 "хирургическая" работа с историей
⚠️ требует аккуратности

Используй, когда нужен один конкретный коммит, а не вся ветка.
