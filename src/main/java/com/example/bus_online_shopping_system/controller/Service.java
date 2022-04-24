package com.example.bus_online_shopping_system.controller;

import com.example.bus_online_shopping_system.model.repository.Repository;

public interface Service<R extends Repository<T,ID>,T,ID> extends Repository<T,ID> {
}
