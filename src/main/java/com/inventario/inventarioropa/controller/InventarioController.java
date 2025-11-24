package com.inventario.inventarioropa.controller;

import com.inventario.inventarioropa.dto.InventarioView;
import com.inventario.inventarioropa.repository.StockRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class InventarioController {

    private final StockRepository stockRepository;

    public InventarioController(StockRepository stockRepository) {
        this.stockRepository = stockRepository;
    }

    @GetMapping("/inventario")
    public List<InventarioView> listarInventario() {
        return stockRepository.obtenerInventario();
    }
}
