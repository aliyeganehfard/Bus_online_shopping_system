package com.example.bus_online_shopping_system.controller;

import com.example.bus_online_shopping_system.model.entity.User;
import com.example.bus_online_shopping_system.model.repository.LoginBase;
import com.example.bus_online_shopping_system.model.repository.UserRepository;

public interface UserService extends UserRepository , LoginBase<User> {
}
