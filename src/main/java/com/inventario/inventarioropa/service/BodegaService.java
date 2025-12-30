package com.inventario.inventarioropa.service;

import com.inventario.inventarioropa.dto.BodegaCreateRequest;
import com.inventario.inventarioropa.entity.Bodega;
import com.inventario.inventarioropa.repository.BodegaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BodegaService {

    private final BodegaRepository bodegaRepository;

    public BodegaService(BodegaRepository bodegaRepository) {
        this.bodegaRepository = bodegaRepository;
    }

    public List<Bodega> listarBodegas() {
        return bodegaRepository.findAll();
    }

    public Bodega crearBodega(BodegaCreateRequest request) {
        Bodega bodega = new Bodega();
        bodega.setNombre(request.getNombre());
        bodega.setDireccion(request.getDireccion());
        bodega.setTipoBodega(request.getTipoBodega());
        return bodegaRepository.save(bodega);
    }
}
