package com.inventario.inventarioropa.service;

import com.inventario.inventarioropa.dto.InventarioView;
import com.inventario.inventarioropa.repository.StockRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InventarioService {

    private final StockRepository stockRepository;

    public InventarioService(StockRepository stockRepository) {
        this.stockRepository = stockRepository;
    }

    public List<InventarioView> listarInventario() {
        return stockRepository.obtenerInventario();
    }
}
