package com.example.bus_online_shopping_system.model.util;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class SingletonConnectionTest {
    @Test
    void testConnection(){
        assertDoesNotThrow(SingletonConnection::getSessionFactory);
    }
}