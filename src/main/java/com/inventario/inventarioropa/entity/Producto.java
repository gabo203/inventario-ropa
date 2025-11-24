package com.inventario.inventarioropa.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "PRODUCTO")
public class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_PRODUCTO")
    private Integer idProducto;

    @Column(name = "SKU", nullable = false, length = 50)
    private String sku;

    @Column(name = "NOMBRE_PRODUCTO", nullable = false, length = 200)
    private String nombreProducto;

    @Column(name = "CATEGORIA", nullable = false, length = 100)
    private String categoria;

    @Column(name = "TALLA", nullable = false, length = 20)
    private String talla;

    @Column(name = "COLOR", nullable = false, length = 30)
    private String color;

    @Column(name = "GENERO", nullable = false, length = 30)
    private String genero;

    @Column(name = "MATERIAL", nullable = false, length = 50)
    private String material;

    @Column(name = "TEMPORADA", nullable = false, length = 50)
    private String temporada;

    @Column(name = "MARCA", nullable = false, length = 50)
    private String marca;

    @Column(name = "CODIGO_BARRAS", nullable = false, length = 20)
    private String codigoBarras;

    // Getters y Setters

    public Integer getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getTemporada() {
        return temporada;
    }

    public void setTemporada(String temporada) {
        this.temporada = temporada;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getCodigoBarras() {
        return codigoBarras;
    }

    public void setCodigoBarras(String codigoBarras) {
        this.codigoBarras = codigoBarras;
    }
}
