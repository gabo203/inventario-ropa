package com.inventario.inventarioropa.controller;

import com.inventario.inventarioropa.dto.InventarioView;
import com.inventario.inventarioropa.service.InventarioService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class InventarioController {

    private final InventarioService inventarioService;

    public InventarioController(InventarioService inventarioService) {
        this.inventarioService = inventarioService;
    }

    @GetMapping("/inventario")
    public List<InventarioView> listarInventario() {
        return inventarioService.listarInventario();
    }
}
