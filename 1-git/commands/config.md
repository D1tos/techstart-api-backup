# Первоначальная настройка Git (config, алиасы, SSH-ключи)

## Настройка имени и электронной почты
git config --global user.name "Ваше Имя"
git config --global user.email "ваш_email@example.com"

Проверка настроек
git config --global --list

## Настройка редактора по умолчанию
### nano
git config --global core.editor "nano"

### vim
git config --global core.editor "vim"

## Полезные алиасы
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.last "log -1 HEAD"

## Генерация и настройка SSH-ключей
ssh-keygen -t ed25519 -C "ваш_email@example.com"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub

Добавить ключ в настройки гита

## Проверка SSH-подключения

ssh -T git@github.com
