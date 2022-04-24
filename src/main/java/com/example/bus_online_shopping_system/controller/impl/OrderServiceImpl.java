package com.example.bus_online_shopping_system.controller.impl;

import com.example.bus_online_shopping_system.controller.OrderService;
import com.example.bus_online_shopping_system.model.entity.Order;
import com.example.bus_online_shopping_system.model.repository.impl.OrderRepositoryImpl;

public class OrderServiceImpl extends ServiceImpl<OrderRepositoryImpl, Order,Integer> implements OrderService {
    private OrderRepositoryImpl orderRepository;
    public OrderServiceImpl() {
        super(new OrderRepositoryImpl());
        this.orderRepository=new OrderRepositoryImpl();
    }
}
