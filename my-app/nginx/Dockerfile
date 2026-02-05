# Используем минимальный образ Alpine
FROM nginx:1.24-alpine 

# Устанавливаем только самое необходимое:
# nginx-mod-http-image-filter — модуль для работы с изображениями
RUN apk add --no-cache nginx-mod-http-image-filter

# Создаем рабочую директорию для сайта
WORKDIR /var/www/site1.com

# Копируем конфигурацию nginx и сайт со всеми страницами, меняем владельца файлов на nginx
COPY ./configures/nginx.conf /etc/nginx/nginx.conf
COPY --chown=nginx:nginx ./tasks/ /var/www/site1.com/
COPY ./tasks/entrypoint.sh /entrypoint.sh

# Делам скрипт точкой входа и даем права на выполнение
RUN chmod +x /entrypoint.sh

# Права доступа (в Alpine пользователь nginx)
RUN chown -R nginx:nginx /var/www/site1.com /var/cache/nginx /var/log/nginx /var/run/

# Switch to user nginx
USER nginx

# Открываем стандартные порты
EXPOSE 8080 8443

# Запускаем Nginx через скрипт entrypoint
ENTRYPOINT ["/entrypoint.sh"]