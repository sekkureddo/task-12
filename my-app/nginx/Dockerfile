# Используем минимальный образ Alpine
FROM nginx:1.24-alpine as build

# Устанавливаем только самое необходимое:
# nginx-mod-http-image-filter — модуль для работы с изображениями
RUN apk add --no-cache nginx-mod-http-image-filter

# Создаем рабочую директорию для сайта
WORKDIR /var/www/site1.com

FROM nginx:1.24-alpine as runtime
# Права доступа (в Alpine пользователь nginx)
RUN chown -R nginx:nginx /var/www/site1.com /var/cache/nginx /var/log/nginx /var/run/

# Switch to user nginx
USER nginx

# Копируем конфигурацию nginx и сайт со всеми страницами, меняем владельца файлов на nginx
# Делам скрипт точкой входа и даем права на выполнение
COPY ./configures/nginx.conf /etc/nginx/nginx.conf
COPY --chown=nginx:nginx ./tasks/ /var/www/site1.com/
COPY ./tasks/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# Открываем стандартные порты
EXPOSE 8080 8443

# Запускаем Nginx через скрипт entrypoint
ENTRYPOINT ["/entrypoint.sh"]