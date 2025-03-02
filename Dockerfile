# Используем официальный образ OpenJDK 17
FROM openjdk:17-jdk-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл сборки приложения (JAR-файл) в контейнер
COPY target/SimpleDockerApp-0.0.1-SNAPSHOT.jar app.jar

# Открываем внутренний порт 9095
EXPOSE 9096

# Команда для запуска приложения
ENTRYPOINT ["java", "-jar", "app.jar"]
