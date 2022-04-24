package com.example.bus_online_shopping_system.controller.impl;

import com.example.bus_online_shopping_system.controller.UserService;
import com.example.bus_online_shopping_system.model.entity.User;
import com.example.bus_online_shopping_system.model.repository.UserRepository;
import com.example.bus_online_shopping_system.model.repository.impl.UserRepositoryImpl;

public class UserServiceImpl extends ServiceImpl<UserRepositoryImpl, User,Integer> implements UserService {
    private UserRepositoryImpl userRepository;
    public UserServiceImpl() {
        super(new UserRepositoryImpl());
        userRepository = new UserRepositoryImpl();
    }
}
