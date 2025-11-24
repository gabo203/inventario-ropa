package com.inventario.inventarioropa.repository;

import com.inventario.inventarioropa.dto.InventarioView;
import com.inventario.inventarioropa.entity.Stock;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface StockRepository extends JpaRepository<Stock, Integer> {

    @Query("""
           SELECT new com.inventario.inventarioropa.dto.InventarioView(
               s.producto.sku,
               s.producto.nombreProducto,
               s.ubicacion.bodega.nombre,
               s.ubicacion.codigoUbicacion,
               s.cantidad,
               s.stockMinimo
           )
           FROM Stock s
           """)
    List<InventarioView> obtenerInventario();
}
