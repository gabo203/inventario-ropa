package com.inventario.inventarioropa.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "UBICACION")
public class Ubicacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_UBICACION")
    private Integer idUbicacion;

    @ManyToOne
    @JoinColumn(name = "ID_BODEGA")
    private Bodega bodega;

    @Column(name = "CODIGO_UBICACION")
    private String codigoUbicacion;

    public Ubicacion() {
    }

    public Integer getIdUbicacion() {
        return idUbicacion;
    }

    public void setIdUbicacion(Integer idUbicacion) {
        this.idUbicacion = idUbicacion;
    }

    public Bodega getBodega() {
        return bodega;
    }

    public void setBodega(Bodega bodega) {
        this.bodega = bodega;
    }

    public String getCodigoUbicacion() {
        return codigoUbicacion;
    }

    public void setCodigoUbicacion(String codigoUbicacion) {
        this.codigoUbicacion = codigoUbicacion;
    }
}
