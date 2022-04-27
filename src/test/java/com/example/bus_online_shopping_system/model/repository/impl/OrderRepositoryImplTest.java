package com.example.bus_online_shopping_system.model.repository.impl;

import com.example.bus_online_shopping_system.controller.impl.OrderServiceImpl;
import com.example.bus_online_shopping_system.model.entity.Order;
import com.example.bus_online_shopping_system.model.entity.Ticket;
import com.example.bus_online_shopping_system.model.entity.User;
import com.example.bus_online_shopping_system.model.util.Gender;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class OrderRepositoryImplTest {
    private OrderServiceImpl orderService;
    private Order order;

    @BeforeEach
    void beforeEach(){
        orderService = new OrderServiceImpl();
//        act
        order = Order.builder()
                .id(null)
                .name("ali")
//                .gender(Gender.MALE)
                .gender(Gender.valueOf("MALE"))
                .ticket(null)
                .user(null)
                .build();
    }

    @Test
    void save() {
//        act
        orderService.save(order);
        var load = orderService.findById(Order.class,order.getId());
        System.out.println("-------------------------------------");
        System.out.println(load);
//        assert
        Assertions.assertThat(load).isNotNull();
    }

    @Test
    void update() {
//        act
        orderService.save(order);
        order.setName("bv");
        orderService.update(order);
        var load = orderService.findById(Order.class, order.getId());
//        assert
        Assertions.assertThat(order).isEqualTo(load);
    }

    @Test
    void delete() {
//        act
        orderService.save(order);
        orderService.delete(order);
//        assert
        assertNull(orderService.findById(Order.class, order.getId()));
    }

    @Test
    void findById() {
//        act
        orderService.save(order);
        var load = orderService.findById(Order.class, order.getId());
//        assert
        Assertions.assertThat(order).isEqualTo(load);
    }

    @Test
    void findAll() {
//        act
        var size = orderService.findAll(Order.class).size();
        orderService.save(order);
        size++;
//        assert
        Assertions.assertThat(size).isEqualTo(orderService.findAll(Order.class).size());
    }
}