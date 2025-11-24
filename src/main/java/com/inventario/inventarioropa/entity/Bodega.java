package com.inventario.inventarioropa.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "BODEGA")
public class Bodega {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_BODEGA")
    private Integer idBodega;

    @Column(name = "NOMBRE")
    private String nombre;

    @Column(name = "DIRECCION")
    private String direccion;

    @Column(name = "TIPO_BODEGA")
    private String tipoBodega;

    public Bodega() {
    }

    public Integer getIdBodega() {
        return idBodega;
    }

    public void setIdBodega(Integer idBodega) {
        this.idBodega = idBodega;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTipoBodega() {
        return tipoBodega;
    }

    public void setTipoBodega(String tipoBodega) {
        this.tipoBodega = tipoBodega;
    }
}
