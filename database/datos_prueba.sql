/* =========================================================
   03_datos_prueba.sql
   BD: InventarioRopa (SQL Server)
   Inserta datos de prueba de STOCK para el MVP
   ========================================================= */

-- USE InventarioRopa;
-- GO

/* =========================
   Obtener IDs de bodegas
   ========================= */
DECLARE @idCentral INT = (SELECT TOP 1 ID_BODEGA FROM dbo.BODEGA WHERE NOMBRE = 'Bodega Central');
DECLARE @idNorte   INT = (SELECT TOP 1 ID_BODEGA FROM dbo.BODEGA WHERE NOMBRE = 'Bodega Norte');
DECLARE @idSur     INT = (SELECT TOP 1 ID_BODEGA FROM dbo.BODEGA WHERE NOMBRE = 'Bodega Sur');

/* =========================
   Obtener IDs de ubicaciones (por código)
   ========================= */
DECLARE @uA0101 INT = (SELECT TOP 1 ID_UBICACION FROM dbo.UBICACION WHERE ID_BODEGA = @idCentral AND CODIGO_UBICACION = 'A-01-01');
DECLARE @uA0102 INT = (SELECT TOP 1 ID_UBICACION FROM dbo.UBICACION WHERE ID_BODEGA = @idCentral AND CODIGO_UBICACION = 'A-01-02');
DECLARE @uB0101 INT = (SELECT TOP 1 ID_UBICACION FROM dbo.UBICACION WHERE ID_BODEGA = @idCentral AND CODIGO_UBICACION = 'B-01-01');

DECLARE @uN0101 INT = (SELECT TOP 1 ID_UBICACION FROM dbo.UBICACION WHERE ID_BODEGA = @idNorte AND CODIGO_UBICACION = 'N-01-01');
DECLARE @uN0102 INT = (SELECT TOP 1 ID_UBICACION FROM dbo.UBICACION WHERE ID_BODEGA = @idNorte AND CODIGO_UBICACION = 'N-01-02');

DECLARE @uS0101 INT = (SELECT TOP 1 ID_UBICACION FROM dbo.UBICACION WHERE ID_BODEGA = @idSur AND CODIGO_UBICACION = 'S-01-01');

/* =========================
   SKUs de prueba (ajusta si quieres)
   IMPORTANTE: Deben existir en PRODUCTO
   ========================= */
DECLARE @sku1 VARCHAR(100) = 'CAM-001-M-AZUL';
DECLARE @sku2 VARCHAR(100) = 'POL-002-L-NEGRO';
DECLARE @sku3 VARCHAR(100) = 'PAN-003-32-AZUL';

DECLARE @idProd1 INT = (SELECT TOP 1 ID_PRODUCTO FROM dbo.PRODUCTO WHERE SKU = @sku1);
DECLARE @idProd2 INT = (SELECT TOP 1 ID_PRODUCTO FROM dbo.PRODUCTO WHERE SKU = @sku2);
DECLARE @idProd3 INT = (SELECT TOP 1 ID_PRODUCTO FROM dbo.PRODUCTO WHERE SKU = @sku3);

/* =========================
   INSERTS STOCK (variado)
   - No duplica: valida (ID_PRODUCTO, ID_UBICACION)
   - Ajusta STOCK_MINIMO si tu tabla usa otro nombre
   ========================= */

-- Producto 1 (Camisa)
IF @idProd1 IS NOT NULL AND @uA0101 IS NOT NULL
IF NOT EXISTS (SELECT 1 FROM dbo.STOCK WHERE ID_PRODUCTO=@idProd1 AND ID_UBICACION=@uA0101)
    INSERT INTO dbo.STOCK (ID_PRODUCTO, ID_UBICACION, CANTIDAD, STOCK_MINIMO)
    VALUES (@idProd1, @uA0101, 50, 10);

IF @idProd1 IS NOT NULL AND @uA0102 IS NOT NULL
IF NOT EXISTS (SELECT 1 FROM dbo.STOCK WHERE ID_PRODUCTO=@idProd1 AND ID_UBICACION=@uA0102)
    INSERT INTO dbo.STOCK (ID_PRODUCTO, ID_UBICACION, CANTIDAD, STOCK_MINIMO)
    VALUES (@idProd1, @uA0102, 8, 10); -- bajo mínimo (para evidencia)

-- Producto 2 (Polera)
IF @idProd2 IS NOT NULL AND @uB0101 IS NOT NULL
IF NOT EXISTS (SELECT 1 FROM dbo.STOCK WHERE ID_PRODUCTO=@idProd2 AND ID_UBICACION=@uB0101)
    INSERT INTO dbo.STOCK (ID_PRODUCTO, ID_UBICACION, CANTIDAD, STOCK_MINIMO)
    VALUES (@idProd2, @uB0101, 25, 5);

IF @idProd2 IS NOT NULL AND @uN0101 IS NOT NULL
IF NOT EXISTS (SELECT 1 FROM dbo.STOCK WHERE ID_PRODUCTO=@idProd2 AND ID_UBICACION=@uN0101)
    INSERT INTO dbo.STOCK (ID_PRODUCTO, ID_UBICACION, CANTIDAD, STOCK_MINIMO)
    VALUES (@idProd2, @uN0101, 2, 5); -- bajo mínimo

-- Producto 3 (Pantalón)
IF @idProd3 IS NOT NULL AND @uN0102 IS NOT NULL
IF NOT EXISTS (SELECT 1 FROM dbo.STOCK WHERE ID_PRODUCTO=@idProd3 AND ID_UBICACION=@uN0102)
    INSERT INTO dbo.STOCK (ID_PRODUCTO, ID_UBICACION, CANTIDAD, STOCK_MINIMO)
    VALUES (@idProd3, @uN0102, 12, 6);

IF @idProd3 IS NOT NULL AND @uS0101 IS NOT NULL
IF NOT EXISTS (SELECT 1 FROM dbo.STOCK WHERE ID_PRODUCTO=@idProd3 AND ID_UBICACION=@uS0101)
    INSERT INTO dbo.STOCK (ID_PRODUCTO, ID_UBICACION, CANTIDAD, STOCK_MINIMO)
    VALUES (@idProd3, @uS0101, 0, 6); -- sin stock (para evidencia)

/* =========================
   Verificación rápida
   ========================= */
SELECT TOP 200 *
FROM dbo.STOCK
ORDER BY ID_STOCK DESC;
