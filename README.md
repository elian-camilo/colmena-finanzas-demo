<div align="center">
  <img src="app/presentation/web/static/img/logo.svg" alt="Money Panel Logo" width="150" height="150">
</div>

# Money Panel

A clean, production-ready minimalist personal finance manager. Built from the ground up to showcase **Clean Architecture** principles in Python, featuring a decoupled backend REST API and a fast server-side rendered frontend.

---

## ⚡ Quick Start for Reviewers

If you are a recruiter or technical reviewer, you can get this project running locally in under 2 minutes.

**Prerequisites:** [Docker](https://docs.docker.com/get-docker/) & Docker Compose.

Run the following commands in your terminal:

```bash
# 1. Setup the environment file
cat <<EOF > .env
DB_USER=postgres
DB_PASSWORD=admin
DB_NAME=money_panel
DB_PORT=5432
DB_HOST=localhost
DATABASE_URL=postgresql://postgres:admin@db:5432/money_panel
SECRET_KEY=dev_secret_key_123
EOF

# 2. Spin up the application and database
docker compose up -d

# 3. Run database migrations inside the API container
docker compose exec api uv run alembic upgrade head
```

Once running, open your browser at **[http://localhost:8000/login-page](http://localhost:8000/login-page)**, create an account, and log in!

---

## 🛠️ Architecture at a Glance

This project enforces strict boundaries and is a demonstration of highly scalable Python engineering.

| Layer | Responsibility | Contains |
|-------|----------------|----------|
| **Domain** | Core business rules & entities | Pydantic entities, custom Exceptions |
| **Application** | Use Cases & interfaces | Business logic, `IUnitOfWork` interface |
| **Infrastructure** | Databases & external APIs | Postgres config, SQLAlchemy models, Repositories |
| **Presentation** | Web & API Routes | FastAPI Routers (JSON API & Jinja2 Web UI) |

> **Key Design Decision:** Routers are strictly forbidden from accessing the database directly. All operations flow through Use Cases injected with a `UnitOfWork` to guarantee atomicity and decoupling.

---

## 🚀 Key Features

- **Dual Interface**: A fully functional JSON REST API (`/api/v1`) alongside a Server-Side Rendered Web UI (`/web`).
- **Secure Authentication**: JWT for API consumption and secure HttpOnly cookie-based auth for the Web UI.
- **Financial Tracking**: Manage Transactions, Debts, Accounts, and Categories in one unified dashboard.
- **Minimalist UI**: Built with pure Bootstrap 5 and Jinja2. Zero heavy JS frameworks, resulting in lightning-fast loads and high accessibility.

---

## 🧪 Testing Suite

This project maintains a robust testing environment covering both isolated unit tests for business logic and real database integration tests.

To run the full test suite and visually see the execution process of each test, run the following command inside the active API container:

```bash
docker compose exec -e TEST_DATABASE_URL=postgresql://tester:test123@db_test:5432/testing_db api uv run pytest -v
```

> **Note:** The integration tests automatically spin up and connect to the dedicated `db_test` container defined in the `compose.yaml` to ensure they never touch your local data.

---

## 🔮 The Future of Money Panel

This public repository serves as a foundational demo of the architecture. Moving forward, **Money Panel is transitioning into a private development phase** where it will evolve from a portfolio project into a fully-fledged financial startup.

**Upcoming Private Features:**
- **AI Financial Analysis**: Deep insights into spending habits and saving opportunities using AI.
- **Smart Receipt Capturing**: Automated expense logging through AI-powered image recognition and text extraction.
- **Auto-completion & Predictive Entry**: Smart categorization and filling of transactions based on historical data.

---

## ✉️ Contact

Developed and architected by **Elian Camilo Angarita Sanguino**.

If you're interested in the future of this project, or just want to connect, feel free to reach out:
- [LinkedIn Profile](https://www.linkedin.com/in/elian-camilo-angarita-sanguino/)