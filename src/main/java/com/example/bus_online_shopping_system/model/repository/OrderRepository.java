package com.example.bus_online_shopping_system.model.repository;

import com.example.bus_online_shopping_system.model.entity.Order;

import java.util.List;

public interface OrderRepository {
    List<Order> getUserOrder(Integer userId);
}
