package com.inventario.inventarioropa.controller;

import com.inventario.inventarioropa.dto.BodegaCreateRequest;
import com.inventario.inventarioropa.entity.Bodega;
import com.inventario.inventarioropa.service.BodegaService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/bodegas")
public class BodegaController {

    private final BodegaService bodegaService;

    public BodegaController(BodegaService bodegaService) {
        this.bodegaService = bodegaService;
    }

    @GetMapping
    public ResponseEntity<List<Bodega>> listar() {
        return ResponseEntity.ok(bodegaService.listarBodegas());
    }

    @PostMapping
    public ResponseEntity<Bodega> crear(@Valid @RequestBody BodegaCreateRequest request) {
        Bodega creada = bodegaService.crearBodega(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(creada);
    }
}
