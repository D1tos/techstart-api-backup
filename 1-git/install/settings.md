# Первоначальная настройка Git (config, alias, SSH-key)
Перед начало работы с Git провести первоначальную настройку.
Это сократить время на рутинные операции, поможет работать удобно и безопасно

## Настройка имени и электронной почты
Установить своё имя и email - они будут исопльзоваться для идентификации автора коммитов:

git config --global user.name "Имя"
git config --global user.email "эмейл@эмейл.ком"

Проверить, что настройки сохранились:

git config --global --list

## Настройка редактора по умолчанию
Git использует текстовый редактор
Установим удобный

### nano
git config --global core.editor "nano"

### vim
git config --global core.editor "vim"

## Полезные алиасы
Алиасы - сокращения длинных команд.

Примеры:

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git congif --global alias.last "log -1 HEAD"

## Генерация и настройка SSH-Ключей
SSH-ключи нужны для безопасного доступа к удаленным репозиториям

### Настройка SSH-ключей
 - Сгенерировать ключ
ssh-keygen -t ed25519 -C "example@email.com"
 - Запустить SSH-агент и добавить ключ
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_25519
 - Скопировать публичный ключ после команды
cat ~/.ssh/id_ed25519.pub
 - Добавить ключ в настройки аккаунта github (раздел SSH keys)

## Проверка SSH-подключения
ssh -T git@github.com

Должно появиться приветствие от GitHub
