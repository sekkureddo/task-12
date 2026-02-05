#!/bin/sh
# Создаем папку для API внутри вашего нового пути
mkdir -p /var/www/site1.com/api

# Запускаем цикл обновления в фоне, при запуске контейнера бесконечно читает нагрузку и записывает ее в файл, который будет доступен по пути /api/load, который мы настроили в конфиге nginx для обработки запросов к API, где ее обрабатывает js
(while true; do
  cat /proc/loadavg | awk '{print $1 " " $2 " " $3}' > /var/www/site1.com/api/load
  sleep 1
done) &

# Запускаем Nginx
exec nginx -g 'daemon off;'