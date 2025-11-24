package com.inventario.inventarioropa.dto;

public class InventarioView {

    private String sku;
    private String nombreProducto;
    private String bodega;
    private String ubicacion;
    private Integer cantidad;
    private Integer stockMinimo;

    public InventarioView(String sku,
                          String nombreProducto,
                          String bodega,
                          String ubicacion,
                          Integer cantidad,
                          Integer stockMinimo) {
        this.sku = sku;
        this.nombreProducto = nombreProducto;
        this.bodega = bodega;
        this.ubicacion = ubicacion;
        this.cantidad = cantidad;
        this.stockMinimo = stockMinimo;
    }

    public String getSku() {
        return sku;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public String getBodega() {
        return bodega;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public Integer getStockMinimo() {
        return stockMinimo;
    }
}
