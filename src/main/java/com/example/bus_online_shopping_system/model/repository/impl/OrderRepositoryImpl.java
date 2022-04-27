package com.example.bus_online_shopping_system.model.repository.impl;

import com.example.bus_online_shopping_system.model.entity.Order;
import com.example.bus_online_shopping_system.model.repository.OrderRepository;

import java.util.List;

public class OrderRepositoryImpl extends RepositoryImpl<Order,Integer> implements OrderRepository {
    @Override
    public List<Order> getUserOrder(Integer userId) {
        try(var session = getSessionFactory().openSession()){
            try {
                return session.createQuery("SELECT o FROM Order o " +
                        "WHERE o.user.id = :userId",Order.class)
                        .setParameter("userId",userId)
                        .list();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return null;
    }
}
