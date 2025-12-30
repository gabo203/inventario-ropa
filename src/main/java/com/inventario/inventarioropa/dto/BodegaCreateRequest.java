package com.inventario.inventarioropa.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class BodegaCreateRequest {

    @NotBlank(message = "nombre es obligatorio")
    @Size(max = 100, message = "nombre debe tener máximo 100 caracteres")
    private String nombre;

    @NotBlank(message = "direccion es obligatoria")
    @Size(max = 200, message = "direccion debe tener máximo 200 caracteres")
    private String direccion;

    @NotBlank(message = "tipoBodega es obligatorio")
    @Size(max = 50, message = "tipoBodega debe tener máximo 50 caracteres")
    private String tipoBodega;

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }

    public String getTipoBodega() { return tipoBodega; }
    public void setTipoBodega(String tipoBodega) { this.tipoBodega = tipoBodega; }
}
