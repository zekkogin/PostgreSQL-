#!/bin/bash

# Создаем папку src, если она не существует
mkdir -p src

# Массив с именами папок
for i in {0..9}; do
    for folder in SQL_beginner._Day0${i}-1-develop; do
        # Проверяем существование папки
        if [ -d "$folder/src" ]; then
            # Копируем файлы из подпапок ex00 до ex09 в папку src
            cp -n "$folder/src/ex0"{0..9}/* src/
            echo "Файлы успешно скопированы из $folder в папку src"
        fi
    done
done
