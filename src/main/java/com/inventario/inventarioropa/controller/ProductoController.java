package com.inventario.inventarioropa.controller;

import com.inventario.inventarioropa.dto.ProductoCreateRequest;
import com.inventario.inventarioropa.entity.Producto;
import com.inventario.inventarioropa.service.ProductoService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ProductoController {

    private final ProductoService productoService;

    public ProductoController(ProductoService productoService) {
        this.productoService = productoService;
    }

    @GetMapping("/productos")
    public List<Producto> listarProductos() {
        return productoService.listarProductos();
    }

    // POST de prueba para evidenciar validaciones (Semana 7)
    @PostMapping("/productos")
    public ResponseEntity<ProductoCreateRequest> crearProducto(@Valid @RequestBody ProductoCreateRequest request) {
        // Por ahora solo devolvemos el request para probar validaciones (luego lo conectas a DB)
        return ResponseEntity.ok(request);
    }
}
