/* =========================================================
   01_crear_tablas.sql
   BD: InventarioRopa (SQL Server)
   Crea tablas base del sistema de inventario (si no existen)
   ========================================================= */

-- (Opcional) asegúrate de estar en tu BD
-- USE InventarioRopa;
-- GO

/* =========================
   BODEGA
   ========================= */
IF OBJECT_ID('dbo.BODEGA', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.BODEGA (
        ID_BODEGA     INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        NOMBRE        NVARCHAR(100) NOT NULL,
        DIRECCION     NVARCHAR(200) NULL,
        TIPO_BODEGA   NVARCHAR(50)  NULL
    );
END
GO

/* =========================
   UBICACION
   ========================= */
IF OBJECT_ID('dbo.UBICACION', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.UBICACION (
        ID_UBICACION      INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        ID_BODEGA         INT NOT NULL,
        CODIGO_UBICACION  NVARCHAR(50) NOT NULL,
        DESCRIPCION       NVARCHAR(200) NULL,

        CONSTRAINT FK_UBICACION_BODEGA
            FOREIGN KEY (ID_BODEGA) REFERENCES dbo.BODEGA(ID_BODEGA)
    );

    -- Evita duplicados de código dentro de una misma bodega
    CREATE UNIQUE INDEX UX_UBICACION_BODEGA_CODIGO
        ON dbo.UBICACION (ID_BODEGA, CODIGO_UBICACION);
END
GO

/* =========================
   PRODUCTO
   ========================= */
IF OBJECT_ID('dbo.PRODUCTO', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.PRODUCTO (
        ID_PRODUCTO     INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        SKU             NVARCHAR(60)  NOT NULL,
        NOMBRE_PRODUCTO NVARCHAR(150) NOT NULL,
        CATEGORIA       NVARCHAR(80)  NULL,
        TALLA           NVARCHAR(20)  NULL,
        COLOR           NVARCHAR(30)  NULL,
        GENERO          NVARCHAR(30)  NULL,
        MATERIAL        NVARCHAR(60)  NULL,
        TEMPORADA       NVARCHAR(60)  NULL,
        MARCA           NVARCHAR(60)  NULL,
        CODIGO_BARRAS   NVARCHAR(30)  NULL,

        CONSTRAINT UX_PRODUCTO_SKU UNIQUE (SKU)
    );

    -- (Opcional) si quieres código de barras único cuando exista
    -- CREATE UNIQUE INDEX UX_PRODUCTO_CODIGO_BARRAS ON dbo.PRODUCTO (CODIGO_BARRAS)
    -- WHERE CODIGO_BARRAS IS NOT NULL;
END
GO

/* =========================
   STOCK
   ========================= */
IF OBJECT_ID('dbo.STOCK', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.STOCK (
        ID_STOCK       INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        ID_PRODUCTO    INT NOT NULL,
        ID_UBICACION   INT NOT NULL,
        CANTIDAD       INT NOT NULL CONSTRAINT DF_STOCK_CANTIDAD DEFAULT (0),
        STOCK_MINIMO   INT NOT NULL CONSTRAINT DF_STOCK_MINIMO DEFAULT (0),

        CONSTRAINT FK_STOCK_PRODUCTO
            FOREIGN KEY (ID_PRODUCTO) REFERENCES dbo.PRODUCTO(ID_PRODUCTO),

        CONSTRAINT FK_STOCK_UBICACION
            FOREIGN KEY (ID_UBICACION) REFERENCES dbo.UBICACION(ID_UBICACION),

        CONSTRAINT CK_STOCK_CANTIDAD_NO_NEGATIVA CHECK (CANTIDAD >= 0),
        CONSTRAINT CK_STOCK_MINIMO_NO_NEGATIVO CHECK (STOCK_MINIMO >= 0)
    );

    -- Evita duplicar el mismo producto en la misma ubicación
    CREATE UNIQUE INDEX UX_STOCK_PRODUCTO_UBICACION
        ON dbo.STOCK (ID_PRODUCTO, ID_UBICACION);
END
GO

/* =========================
   MOVIMIENTO_INVENTARIO (para trazabilidad)
   ========================= */
IF OBJECT_ID('dbo.MOVIMIENTO_INVENTARIO', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.MOVIMIENTO_INVENTARIO (
        ID_MOVIMIENTO   INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        ID_PRODUCTO     INT NOT NULL,
        ID_UBICACION    INT NOT NULL,
        TIPO_MOVIMIENTO NVARCHAR(20) NOT NULL,  -- ENTRADA / SALIDA / AJUSTE
        CANTIDAD        INT NOT NULL,
        FECHA           DATETIME2 NOT NULL CONSTRAINT DF_MOV_FECHA DEFAULT (SYSDATETIME()),
        OBSERVACION     NVARCHAR(250) NULL,

        CONSTRAINT FK_MOV_PRODUCTO
            FOREIGN KEY (ID_PRODUCTO) REFERENCES dbo.PRODUCTO(ID_PRODUCTO),

        CONSTRAINT FK_MOV_UBICACION
            FOREIGN KEY (ID_UBICACION) REFERENCES dbo.UBICACION(ID_UBICACION),

        CONSTRAINT CK_MOV_TIPO CHECK (TIPO_MOVIMIENTO IN ('ENTRADA','SALIDA','AJUSTE')),
        CONSTRAINT CK_MOV_CANTIDAD_POSITIVA CHECK (CANTIDAD > 0)
    );
END
GO
