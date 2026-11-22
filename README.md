логи для 4 баллов в файле 4poings.log

настройки compose для 6 баллов:

name: app-with-volumes
services:
  app:
    build: .
    ports:
      - ${HOST_PORT}:8000
    environment:
      - PORT=8000
      - GREETING=${GREETING}
      - STORAGE=sqlite
      - DATA_FILE=/data/counter.db
    volumes:
      - data:/data
volumes:
  data:

команды запуска и ответы приложения в 6points.log

настройки compose для 8 баллов:

name: app-with-volumes
services:
  app:
    build: .
    ports:
      - ${HOST_PORT}:8000
    environment:
      - PORT=8000
      - GREETING=${GREETING}
      - STORAGE=redis
      - REDIS_URL=redis://redis:6379/0
    depends_on:
      redis:
        condition: service_healthy
    healthcheck:
      test: ["CMD", "python", "-c", "import urllib.request; urllib.request.urlopen('https://127/0/0/1:8000/readyz', timeout=2)"]
      interval: 5s
      timeout: 3s
      retries: 5
      start_period: 3s
  redis:
    image: redis:7.4-alpine
    volumes:
      - data:/data
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 5s
      timeout: 3s
      retries: 5
      start_period: 3s
volumes:
  data:

команды запуска и ответы приложения в файле 8points.log

изменяемые переменные окружения во всех запусках совпадали с .env.example
