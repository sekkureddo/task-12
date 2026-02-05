# Используем минимальный образ Alpine
FROM alpine:3.18

# 1. Устанавливаем только самое необходимое:
# apache2 — веб-сервер
# php81-apache2 — это и есть mod_php для Alpine
RUN apk add --no-cache \
    apache2 \
    php81-apache2

#  Меняем порт 80 на 8080 в конфиге Apache
RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/httpd.conf

# 2. Создаем файл phpinfo, чтобы проверить, что PHP работает через Apache, и удаляем стандартную страницу Apache
RUN echo "<?php phpinfo(); ?>" > /var/www/localhost/htdocs/index.php && \
    rm /var/www/localhost/htdocs/index.html

# 3. Настройка прав (в Alpine Apache работает от пользователя apache)
RUN chown -R apache:apache /var/www/localhost/htdocs /run/apache2 /var/log/apache2

# переключаемся на пользователя apache, чтобы контейнер не работал от root
USER apache

# Открываем стандартный порт
EXPOSE 8080

# Запускаем Apache в фоновом режиме (Foreground), чтобы контейнер не выключился
CMD ["httpd", "-D", "FOREGROUND"]