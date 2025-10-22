# 🏢 Business Platform FastAPI Backend

Современный корпоративный бэкенд с админ панелью, построенный на FastAPI.

## ✨ Особенности

- **🚀 FastAPI** - Современный, быстрый веб-фреймворк для Python
- **📊 SQLAlchemy** - Мощная ORM с поддержкой асинхронности
- **🔐 JWT Аутентификация** - Безопасная система авторизации
- **⚙️ Админ панель** - Полнофункциональная административная панель
- **📚 Автодокументация** - Swagger UI и ReDoc из коробки
- **🔄 Асинхронность** - Высокая производительность
- **🏗️ Модульная архитектура** - Легко расширяемая структура

## 🏗️ Архитектура

```
app/
├── api/v1/           # API endpoints
│   ├── auth/         # Аутентификация
│   ├── companies/    # Управление компаниями
│   ├── departments/  # Управление отделами
│   ├── employees/    # Управление сотрудниками
│   ├── tasks/        # Система задач
│   ├── finances/     # Финансовый модуль
│   ├── knowledge/    # База знаний
│   ├── academy/      # Академия
│   └── news/         # Новости
├── core/             # Основная конфигурация
├── models/           # SQLAlchemy модели
├── schemas/          # Pydantic схемы
├── services/         # Бизнес-логика
├── admin/            # Админ панель
└── main.py          # Точка входа
```

## 🚀 Быстрый старт

### 1. Установка зависимостей

```bash
# Установка Python зависимостей
pip install -e .

# Или через pip
pip install fastapi uvicorn sqlalchemy asyncpg psycopg2-binary
```

### 2. Настройка базы данных

```bash
# Создание базы данных PostgreSQL
createdb business_platform

# Настройка переменных окружения
cp .env.example .env
# Отредактируйте .env файл с вашими настройками
```

### 3. Запуск приложения

```bash
# Режим разработки
uvicorn app.main:app --host 0.0.0.0 --port 3001 --reload

# Или через скрипт
python -m app.main
```

### 4. Доступ к приложению

- **API**: http://localhost:3001/api/v1
- **Документация**: http://localhost:3001/api/docs
- **ReDoc**: http://localhost:3001/api/redoc
- **Админ панель**: http://localhost:3001/admin

## 📊 Модели данных

### Основные сущности:

- **👥 Пользователи** - Система пользователей с ролями
- **🏢 Компании** - Мультитенантная архитектура
- **🏬 Отделы** - Иерархическая структура отделов
- **👨‍💼 Сотрудники** - Управление персоналом
- **📋 Задачи** - Kanban доски, спринты, эпики
- **💰 Финансы** - Транзакции и счета
- **📚 База знаний** - Статьи, папки, квизы
- **🎓 Академия** - Курсы, программы, уроки
- **📰 Новости** - Корпоративные новости

## 🔐 Аутентификация

API использует JWT токены для аутентификации:

```bash
# Вход в систему
curl -X POST "http://localhost:3001/api/v1/auth/login" \
  -H "Content-Type: application/json" \
  -d '{"email": "user@example.com", "password": "password"}'

# Использование токена
curl -X GET "http://localhost:3001/api/v1/auth/me" \
  -H "Authorization: Bearer <your-token>"
```

## ⚙️ Админ панель

Полнофункциональная админ панель доступна по адресу `/admin`:

- **📊 Dashboard** - Общая статистика
- **👥 Управление пользователями** - CRUD операции
- **🏢 Управление компаниями** - Мультитенантность
- **📋 Управление задачами** - Kanban доски
- **💰 Финансовый модуль** - Транзакции и счета
- **📚 Контент** - Новости и база знаний
- **🎓 Академия** - Курсы и программы

## 🔧 Конфигурация

Основные настройки в файле `app/core/config.py`:

```python
class Settings(BaseSettings):
    PROJECT_NAME: str = "Business Platform API"
    SECRET_KEY: str = "your-secret-key"
    DATABASE_URL: str = "postgresql://..."
    ALLOWED_HOSTS: List[str] = ["http://localhost:3000"]
    # ... другие настройки
```

## 📝 API Endpoints

### Аутентификация
- `POST /api/v1/auth/login` - Вход в систему
- `POST /api/v1/auth/register` - Регистрация
- `GET /api/v1/auth/me` - Текущий пользователь

### Компании
- `GET /api/v1/companies` - Список компаний
- `POST /api/v1/companies` - Создание компании
- `GET /api/v1/companies/{id}` - Получение компании
- `PUT /api/v1/companies/{id}` - Обновление компании
- `DELETE /api/v1/companies/{id}` - Удаление компании

### Задачи
- `GET /api/v1/tasks` - Список задач
- `POST /api/v1/tasks` - Создание задачи
- `GET /api/v1/tasks/{id}` - Получение задачи
- `PUT /api/v1/tasks/{id}` - Обновление задачи
- `DELETE /api/v1/tasks/{id}` - Удаление задачи

### И многие другие...

## 🐳 Docker

```bash
# Сборка образа
docker build -t business-platform-api .

# Запуск контейнера
docker run -p 3001:3001 business-platform-api
```

## 🧪 Тестирование

```bash
# Запуск тестов
pytest

# С покрытием
pytest --cov=app
```

## 📈 Мониторинг

- **Health Check**: `GET /health`
- **Метрики**: Встроенные метрики FastAPI
- **Логирование**: Настраиваемые уровни логирования

## 🤝 Разработка

### Структура проекта:
- Следуйте принципам SOLID
- Используйте type hints
- Покрывайте код тестами
- Документируйте API endpoints

### Команды разработки:
```bash
# Форматирование кода
black app/
isort app/

# Проверка типов
mypy app/

# Линтинг
flake8 app/
```

## 📄 Лицензия

MIT License - см. файл LICENSE

## 👥 Команда

Разработано командой TKO для корпоративной платформы.

---

**🚀 Готово к продакшену!** Просто настройте переменные окружения и запускайте.
