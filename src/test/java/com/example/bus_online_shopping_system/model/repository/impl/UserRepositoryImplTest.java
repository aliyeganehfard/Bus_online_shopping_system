package com.example.bus_online_shopping_system.model.repository.impl;

import com.example.bus_online_shopping_system.controller.impl.UserServiceImpl;
import com.example.bus_online_shopping_system.model.entity.User;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UserRepositoryImplTest {
    private UserServiceImpl userService;
    private User user;


    @BeforeEach
    void beforeEach() {
        userService = new UserServiceImpl();
//        arrange
        this.user = User.builder()
                .id(null)
                .username("ali")
                .password("123")
                .build();
    }

    @Test
    void save() {
//        act
        userService.save(user);
        var load = userService.findById(User.class, user.getId());
//        assert
        Assertions.assertThat(load).isNotNull();
    }

    @Test
    void update() {
//        act
        userService.save(user);
        user.setUsername("a");
        user.setPassword("1");
        userService.update(user);
        var load = userService.findById(User.class, user.getId());
//        assert
        Assertions.assertThat(user).isEqualTo(load);
    }

    @Test
    void delete() {
//        act
        userService.save(user);
        userService.delete(user);
//        assert
        assertNull(userService.findById(User.class, user.getId()));
    }

    @Test
    void findById(){
//        act
        userService.save(user);
        var load = userService.findById(User.class, user.getId());
//        assert
        Assertions.assertThat(user).isEqualTo(load);
    }

    @Test
    void findAll(){
//        act
        var size = userService.findAll(User.class).size();
        userService.save(user);
        size++;
//        assert
        Assertions.assertThat(size).isEqualTo(userService.findAll(User.class).size());
    }
}