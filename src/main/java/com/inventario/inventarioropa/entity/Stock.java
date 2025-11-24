package com.inventario.inventarioropa.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "STOCK")
public class Stock {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_STOCK")
    private Integer idStock;

    @ManyToOne
    @JoinColumn(name = "ID_PRODUCTO")
    private Producto producto;

    @ManyToOne
    @JoinColumn(name = "ID_UBICACION")
    private Ubicacion ubicacion;

    @Column(name = "CANTIDAD")
    private Integer cantidad;

    @Column(name = "STOCK_MINIMO")
    private Integer stockMinimo;

    public Stock() {
    }

    public Integer getIdStock() {
        return idStock;
    }

    public void setIdStock(Integer idStock) {
        this.idStock = idStock;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Ubicacion getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(Ubicacion ubicacion) {
        this.ubicacion = ubicacion;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Integer getStockMinimo() {
        return stockMinimo;
    }

    public void setStockMinimo(Integer stockMinimo) {
        this.stockMinimo = stockMinimo;
    }
}
