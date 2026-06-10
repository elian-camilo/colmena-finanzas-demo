<div align="center">
  <img src="app/presentation/web/static/img/logo.svg" alt="Colmena Logo" width="150" height="150">
</div>

# Colmena — Finanzas Personales sin Ansiedad

<div align="center">
  <img src="app/presentation/web/static/img/screenshot.png" alt="Colmena Beta Screenshot" width="800">
</div>

> [!IMPORTANT]
> **Aviso importante sobre este repositorio**
> 
> - **Demo pública:** Este repositorio es una demo pública (fase beta) de un proyecto privado y comercial en desarrollo activo.
> - **Alcance limitado:** El código aquí expuesto es una muestra de las decisiones arquitectónicas (Clean Architecture) y la calidad de ingeniería aplicada, **no representa el producto final**.
> - **Features avanzadas:** La versión privada incluye funcionalidades como registro asistido por IA, gestión de deudas dinámicas, entre otros.

## ¿Qué es Colmena?

Una app web y móvil para que cualquier persona registre sus ingresos, gastos, deudas y obligaciones de forma **simple, cálida y sin intimidar**. Pensada especialmente para el contexto colombiano, para quienes sienten ansiedad al hablar de dinero pero necesitan entender su situación financiera de forma clara.

## La Necesidad

Los usuarios colombianos no tienen herramientas locales que respeten su contexto cultural. Las apps de finanzas existentes suelen ser frías, complejas o extranjeras. **Necesitan transparencia sin presión, claridad sin tecnicismos.**

## Propuesta de Valor

- **Registro conversacional:** Dicta transacciones por voz o escribe sin frases complicadas *(Disponible en versión privada)*.
- **Visualización empática:** Números grandes y amigables, barras de progreso, secciones claras.
- **Seguimiento integral:** Ingresos, gastos, deudas (me deben / debo) y obligaciones en un solo lugar.
- **Diseño cálido:** Inspirado en referentes globales modernos, pero enfocado en la cercanía local — nada intimidante.

## Funcionalidades Disponibles (Versión Demo Pública)

✅ **Auth:** Login/Registro seguro con JWT y HttpOnly Cookies.

✅ **Dashboard:** Balance mensual y resumen rápido.

✅ **Cuentas:** Gestión de múltiples cuentas (Efectivo, Ahorros, Tarjetas).

✅ **Transacciones:** CUD manual y soporte estructural transaccional.

✅ **Categorías:** Desglose de gastos por tipo.

✅ **Obligaciones & Deudas:** Registro básico de deudas y próximos vencimientos.

✅ **UI Minimalista:** Jinja2 SSR sin pesados frameworks JS, garantizando extrema rapidez.


## Funcionalidades Próximas / Privadas

🚀 Registro automático e inteligente mediante IA (Voz + Texto)
🚀 Exportación a CSV y reportería financiera
🚀 Notificaciones inteligentes de vencimientos
🚀 Conciliación dinámica

## A quién se dirige

**Personas entre 18-45 años:**
- Que manejan múltiples cuentas.
- Que tienen deudas o préstamos personales.
- Que quieren entender su dinero sin jerga financiera.
- Que valoran diseño moderno y confianza local.

## Análisis Competitivo

| | **Colmena** | **Banca Tradicional / Neobancos** | **Apps Extranjeras** | **Hojas de Excel** |
|---|---|---|---|---|
| **Simplicidad** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |
| **Calidez/UX** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | — |
| **Registro IA/Voz** | ✅ *(Versión Privada)* | ❌ | Algunos | ❌ |
| **Deudas Personales** | ✅ | ❌ | Algunos | ✅ |
| **Contexto Local** | ✅ | Neutral | ❌ | — |

**Ventaja clave:** Somos la única alternativa que combina IA para el registro, gestión de deudas personales y calidez local sin complejidad. Competimos con el bloc de notas y el Excel, no con los bancos.

---

## 🛠️ Arquitectura y Calidad de Ingeniería

Este repositorio público actúa como portafolio técnico demostrando el uso de **Clean Architecture** en Python.

| Capa | Responsabilidad | Contenido |
|-------|----------------|----------|
| **Domain** | Reglas core de negocio y entidades | Modelos Pydantic, Excepciones personalizadas |
| **Application** | Casos de Uso (Use Cases) | Lógica orquestadora, interfaz `IUnitOfWork` |
| **Infrastructure** | DB, ORM y APIs externas | Modelos SQLAlchemy, Repositorios, Adaptadores |
| **Presentation** | Rutas Web y API | Routers FastAPI (JSON REST & UI Jinja2) |

> **Decisión clave:** La capa de presentación (Routers) tiene prohibido el acceso directo a la base de datos. Todo fluye a través de los Casos de Uso inyectando un `UnitOfWork` para asegurar límites transaccionales y aislamiento.

---

## ⚡ Guía rápida para Reviewers

Si eres reclutador o reviewer técnico, puedes levantar el entorno de desarrollo en minutos.

**Requisitos:** [Docker](https://docs.docker.com/get-docker/) & Docker Compose.

```bash
# 1. Crea el archivo de variables de entorno
cat <<EOF > .env
DB_USER=postgres
DB_PASSWORD=admin
DB_NAME=money_panel
DB_PORT=5432
DB_HOST=localhost
DATABASE_URL=postgresql://postgres:admin@db:5432/money_panel
SECRET_KEY=dev_secret_key_123
EOF

# 2. Levanta los servicios
docker compose up -d

# 3. Ejecuta las migraciones estructurales
docker compose exec api uv run alembic upgrade head
```

Abre tu navegador en **[http://localhost:8000/login-page](http://localhost:8000/login-page)**, crea un usuario de prueba y explora.

## 🧪 Suite de Pruebas

Mantenemos pruebas unitarias para aislar las reglas de negocio, y pruebas de integración conectadas a una DB real efímera.

Ejecuta todos los tests dentro del contenedor:
```bash
docker compose exec -e TEST_DATABASE_URL=postgresql://tester:test123@db_test:5432/testing_db api uv run pytest -v
```
> **Nota:** Los test de integración levantan y consumen automáticamente la base de datos limpia en el contenedor `db_test` (evitando tocar tus datos de desarrollo).

---

## ✉️ Contacto

Ingeniería y Arquitectura por **Elian Camilo Angarita Sanguino**.

Si te interesa el futuro comercial del producto, o simplemente quieres contactarme:
- [LinkedIn Profile](https://www.linkedin.com/in/elian-camilo-angarita-sanguino/)
- [Repositorio del Proyecto](https://github.com/elian-camilo/colmena-finanzas-demo)
