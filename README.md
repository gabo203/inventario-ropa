<div align="center">

# 👕 Sistema de Inventario de Ropa
### InventarioRopa

![Java](https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.7-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Maven](https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white)

**Backend REST API para la gestión de inventario de ropa**

Permite administrar **productos**, **bodegas**, **ubicaciones**, **stock** y consultas de inventario

[Características](#-características) • [Instalación](#️-configuración-y-ejecución) • [Endpoints](#-endpoints) • [Scripts SQL](#-scripts-sql)

</div>

---

## 📋 Descripción

Aplicación backend que expone endpoints REST para consultar y mantener información de inventario.  
El proyecto está orientado a un **MVP** aplicando buenas prácticas: separación por capas, validaciones de entrada y manejo centralizado de errores.

---

## 🚀 Tecnologías

<table>
<tr>
<td align="center" width="96">
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg" width="48" height="48" alt="Java" />
<br>Java 17
</td>
<td align="center" width="96">
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/spring/spring-original.svg" width="48" height="48" alt="Spring" />
<br>Spring Boot 3.5.7
</td>
<td align="center" width="96">
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/microsoftsqlserver/microsoftsqlserver-plain.svg" width="48" height="48" alt="SQL Server" />
<br>SQL Server
</td>
<td align="center" width="96">
<img src="https://www.svgrepo.com/show/354051/maven.svg" width="48" height="48" alt="Maven" />
<br>Maven
</td>
</tr>
</table>

**Tecnologías principales:**
- **Java 17**
- **Spring Boot 3.5.7**
- **Spring Data JPA / Hibernate**
- **SQL Server**
- **Maven**
- **Bean Validation (jakarta.validation)**

---

## ✅ Características

<table>
<tr>
<td width="50%">

### 📦 Gestión de Productos
Atributos típicos de ropa:
- Talla
- Color
- Género
- Material
- Temporada
- Marca

</td>
<td width="50%">

### 🏢 Gestión de Bodegas
Operaciones MVP:
- `GET` - Listar bodegas
- `POST` - Crear bodegas

</td>
</tr>
<tr>
<td width="50%">

### 📊 Inventario/Stock
Control por:
- Bodega
- Ubicación
- Cantidades en tiempo real

</td>
<td width="50%">

### ⚡ Características Técnicas
- Validaciones con **DTO + @Valid**
- Manejo centralizado de errores
- Respuestas HTTP consistentes

</td>
</tr>
</table>

---

## 🏗️ Estructura del Proyecto

```
src/
├── 📂 main/
│   ├── 📂 java/com/inventario/inventarioropa/
│   │   ├── 🎮 controller/        # Endpoints REST
│   │   ├── 📦 dto/               # DTOs (request/response) + validaciones
│   │   ├── 🗃️ entity/            # Entidades JPA
│   │   ├── ⚠️ exception/         # Manejo centralizado de errores
│   │   ├── 💾 repository/        # Repositorios JPA
│   │   └── 💼 service/           # Lógica de negocio
│   └── 📂 resources/
│       ├── application.properties
│       └── application-local.properties
└── 📂 test/
```

---

## 🗄️ Base de Datos

<div align="center">

### Motor: SQL Server
### Nombre BD: `InventarioRopa`

</div>

**Tablas principales:**

| Tabla | Descripción |
|-------|-------------|
| 📦 `PRODUCTO` | Información de productos textiles |
| 🏢 `BODEGA` | Ubicaciones de almacenamiento |
| 📍 `UBICACION` | Posiciones específicas |
| 📊 `STOCK` | Cantidades disponibles |
| 🔄 `MOVIMIENTO_INVENTARIO` | Registro de movimientos |

---

## ⚙️ Configuración y Ejecución

### 📋 Requisitos

<table>
<tr>
<td align="center">
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg" width="40" height="40" alt="JDK" />
<br><b>JDK 17</b>
</td>
<td align="center">
<img src="https://www.svgrepo.com/show/354051/maven.svg" width="40" height="40" alt="Maven" />
<br><b>Maven</b>
</td>
<td align="center">
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/microsoftsqlserver/microsoftsqlserver-plain.svg" width="40" height="40" alt="SQL Server" />
<br><b>SQL Server</b>
</td>
</tr>
</table>

---

### 🔧 Perfil local

El proyecto utiliza configuración local para ejecutar con credenciales en un archivo separado.

**Ejemplo `application-local.properties`:**

```properties
spring.datasource.url=jdbc:sqlserver://localhost:1433;databaseName=InventarioRopa;encrypt=false
spring.datasource.username=TU_USUARIO
spring.datasource.password=TU_PASSWORD

spring.jpa.hibernate.ddl-auto=none
spring.jpa.show-sql=false
```

---

### ▶️ Ejecutar con perfil local

<table>
<tr>
<td width="50%">

**Linux/Mac:**
```bash
./mvnw spring-boot:run \
  -Dspring-boot.run.profiles=local
```

</td>
<td width="50%">

**Windows:**
```bash
mvnw.cmd spring-boot:run \
  -Dspring-boot.run.profiles=local
```

</td>
</tr>
</table>

<div align="center">

✅ **La aplicación quedará disponible en:**

### `http://localhost:8080`

</div>

---

## 🔌 Endpoints

### 📦 Productos

<details>
<summary><b>GET /productos</b> - Obtener lista de productos</summary>

Retorna la lista de productos.

**Respuesta exitosa:**
```json
[
  {
    "sku": "CAM-001-M-AZUL",
    "nombreProducto": "Camisa Formal",
    "categoria": "Camisas",
    "talla": "M",
    "color": "Azul",
    "genero": "Hombre",
    "material": "Algodón",
    "temporada": "Todo el año",
    "marca": "Elegant",
    "codigoBarras": "12345678"
  }
]
```

</details>

<details>
<summary><b>POST /productos</b> - Crear producto</summary>

Crea un producto (con validaciones).

**Body de ejemplo:**
```json
{
  "sku": "CAM-001-M-AZUL",
  "nombreProducto": "Camisa Formal",
  "categoria": "Camisas",
  "talla": "M",
  "color": "Azul",
  "genero": "Hombre",
  "material": "Algodón",
  "temporada": "Todo el año",
  "marca": "Elegant",
  "codigoBarras": "12345678"
}
```

</details>

---

### 📊 Inventario

<details>
<summary><b>GET /inventario</b> - Consultar inventario</summary>

Retorna una vista consolidada del inventario.

**Respuesta de ejemplo:**
```json
[
  {
    "sku": "CAM-001-M-AZUL",
    "nombreProducto": "Camisa Formal",
    "bodega": "Bodega Central",
    "ubicacion": "A-01-03",
    "cantidad": 50,
    "stockMinimo": 10
  }
]
```

</details>

---

### 🏢 Bodegas (MVP)

<details>
<summary><b>GET /bodegas</b> - Listar bodegas</summary>

Lista todas las bodegas registradas.

</details>

<details>
<summary><b>POST /bodegas</b> - Registrar bodega</summary>

Registra una nueva bodega.

**Body de ejemplo:**
```json
{
  "nombre": "Bodega Central",
  "direccion": "Av. Principal 123",
  "tipoBodega": "Central"
}
```

</details>

---

## 🧪 Pruebas

Ejecutar tests:

```bash
./mvnw test
```

---

## 🧾 Scripts SQL

El proyecto incluye scripts para despliegue y pruebas en:

```
database/
├── 📄 01_crear_tablas.sql      # Creación del esquema
├── 📄 02_datos_iniciales.sql   # Datos maestros
└── 📄 03_datos_prueba.sql      # Datos de ejemplo
```

---

## 📝 Validaciones y Errores

<div align="center">

### ✅ Validaciones Automáticas

Se aplican validaciones en DTOs con `@Valid` y restricciones de `jakarta.validation`

</div>

Cuando un request no cumple las validaciones, la API responde con:

```
🔴 400 Bad Request
```

El manejo de errores está centralizado según el handler configurado.

---

## 👤 Autor

<div align="center">

### Gabriel Ignacio Ibáñez Sepúlveda

**Práctica Profesional – Ingeniería en Informática**



</div>