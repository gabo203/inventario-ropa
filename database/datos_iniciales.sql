/* =========================================================
   02_datos_iniciales.sql
   BD: InventarioRopa (SQL Server)
   Inserta datos base (Bodegas + Ubicaciones)
   ========================================================= */

-- USE InventarioRopa;
-- GO

/* =========================
   BODEGAS BASE
   ========================= */

IF NOT EXISTS (SELECT 1 FROM dbo.BODEGA WHERE NOMBRE = 'Bodega Central')
BEGIN
    INSERT INTO dbo.BODEGA (NOMBRE, DIRECCION, TIPO_BODEGA)
    VALUES ('Bodega Central', 'Av. Principal 123', 'Central');
END

IF NOT EXISTS (SELECT 1 FROM dbo.BODEGA WHERE NOMBRE = 'Bodega Norte')
BEGIN
    INSERT INTO dbo.BODEGA (NOMBRE, DIRECCION, TIPO_BODEGA)
    VALUES ('Bodega Norte', 'Calle Norte 456', 'Sucursal');
END

IF NOT EXISTS (SELECT 1 FROM dbo.BODEGA WHERE NOMBRE = 'Bodega Sur')
BEGIN
    INSERT INTO dbo.BODEGA (NOMBRE, DIRECCION, TIPO_BODEGA)
    VALUES ('Bodega Sur', 'Calle Sur 789', 'Sucursal');
END

/* =========================
   UBICACIONES BASE
   ========================= */

DECLARE @idCentral INT = (SELECT TOP 1 ID_BODEGA FROM dbo.BODEGA WHERE NOMBRE = 'Bodega Central');
DECLARE @idNorte   INT = (SELECT TOP 1 ID_BODEGA FROM dbo.BODEGA WHERE NOMBRE = 'Bodega Norte');
DECLARE @idSur     INT = (SELECT TOP 1 ID_BODEGA FROM dbo.BODEGA WHERE NOMBRE = 'Bodega Sur');

-- Central: A-01-01 / A-01-02 / B-01-01
IF @idCentral IS NOT NULL
BEGIN
    IF NOT EXISTS (SELECT 1 FROM dbo.UBICACION WHERE ID_BODEGA = @idCentral AND CODIGO_UBICACION = 'A-01-01')
        INSERT INTO dbo.UBICACION (ID_BODEGA, CODIGO_UBICACION, DESCRIPCION)
        VALUES (@idCentral, 'A-01-01', 'Pasillo A, estante 01, nivel 01');

    IF NOT EXISTS (SELECT 1 FROM dbo.UBICACION WHERE ID_BODEGA = @idCentral AND CODIGO_UBICACION = 'A-01-02')
        INSERT INTO dbo.UBICACION (ID_BODEGA, CODIGO_UBICACION, DESCRIPCION)
        VALUES (@idCentral, 'A-01-02', 'Pasillo A, estante 01, nivel 02');

    IF NOT EXISTS (SELECT 1 FROM dbo.UBICACION WHERE ID_BODEGA = @idCentral AND CODIGO_UBICACION = 'B-01-01')
        INSERT INTO dbo.UBICACION (ID_BODEGA, CODIGO_UBICACION, DESCRIPCION)
        VALUES (@idCentral, 'B-01-01', 'Pasillo B, estante 01, nivel 01');
END

-- Norte: N-01-01 / N-01-02
IF @idNorte IS NOT NULL
BEGIN
    IF NOT EXISTS (SELECT 1 FROM dbo.UBICACION WHERE ID_BODEGA = @idNorte AND CODIGO_UBICACION = 'N-01-01')
        INSERT INTO dbo.UBICACION (ID_BODEGA, CODIGO_UBICACION, DESCRIPCION)
        VALUES (@idNorte, 'N-01-01', 'Sector Norte, estante 01, nivel 01');

    IF NOT EXISTS (SELECT 1 FROM dbo.UBICACION WHERE ID_BODEGA = @idNorte AND CODIGO_UBICACION = 'N-01-02')
        INSERT INTO dbo.UBICACION (ID_BODEGA, CODIGO_UBICACION, DESCRIPCION)
        VALUES (@idNorte, 'N-01-02', 'Sector Norte, estante 01, nivel 02');
END

-- Sur: S-01-01
IF @idSur IS NOT NULL
BEGIN
    IF NOT EXISTS (SELECT 1 FROM dbo.UBICACION WHERE ID_BODEGA = @idSur AND CODIGO_UBICACION = 'S-01-01')
        INSERT INTO dbo.UBICACION (ID_BODEGA, CODIGO_UBICACION, DESCRIPCION)
        VALUES (@idSur, 'S-01-01', 'Sector Sur, estante 01, nivel 01');
END

/* =========================
   Verificación rápida
   ========================= */
SELECT * FROM dbo.BODEGA ORDER BY ID_BODEGA;
SELECT * FROM dbo.UBICACION ORDER BY ID_UBICACION;
