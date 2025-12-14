package com.inventario.inventarioropa.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import jakarta.validation.constraints.Pattern;

public class ProductoCreateRequest {

    @NotBlank(message = "sku is required")
    @Size(max = 50, message = "sku must be <= 50 chars")
    private String sku;

    @NotBlank(message = "nombreProducto is required")
    @Size(max = 100, message = "nombreProducto must be <= 100 chars")
    private String nombreProducto;

    @NotBlank(message = "categoria is required")
    @Size(max = 50, message = "categoria must be <= 50 chars")
    private String categoria;

    @NotBlank(message = "talla is required")
    @Size(max = 10, message = "talla must be <= 10 chars")
    private String talla;

    @NotBlank(message = "color is required")
    @Size(max = 30, message = "color must be <= 30 chars")
    private String color;

    @NotBlank(message = "genero is required")
    @Size(max = 30, message = "genero must be <= 30 chars")
    private String genero;

    @NotBlank(message = "material is required")
    @Size(max = 50, message = "material must be <= 50 chars")
    private String material;

    @NotBlank(message = "temporada is required")
    @Size(max = 50, message = "temporada must be <= 50 chars")
    private String temporada;

    @NotBlank(message = "marca is required")
    @Size(max = 50, message = "marca must be <= 50 chars")
    private String marca;

    // Solo números, mínimo 8 (ajústalo si tu caso requiere otro formato)
    @NotBlank(message = "codigoBarras is required")
    @Pattern(regexp = "^[0-9]{8,}$", message = "codigoBarras must be numeric and length >= 8")
    private String codigoBarras;

    // getters & setters
    public String getSku() { return sku; }
    public void setSku(String sku) { this.sku = sku; }

    public String getNombreProducto() { return nombreProducto; }
    public void setNombreProducto(String nombreProducto) { this.nombreProducto = nombreProducto; }

    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }

    public String getTalla() { return talla; }
    public void setTalla(String talla) { this.talla = talla; }

    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }

    public String getGenero() { return genero; }
    public void setGenero(String genero) { this.genero = genero; }

    public String getMaterial() { return material; }
    public void setMaterial(String material) { this.material = material; }

    public String getTemporada() { return temporada; }
    public void setTemporada(String temporada) { this.temporada = temporada; }

    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }

    public String getCodigoBarras() { return codigoBarras; }
    public void setCodigoBarras(String codigoBarras) { this.codigoBarras = codigoBarras; }
}
