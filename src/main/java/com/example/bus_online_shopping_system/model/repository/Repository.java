package com.example.bus_online_shopping_system.model.repository;

import com.example.bus_online_shopping_system.model.util.SingletonConnection;
import org.hibernate.SessionFactory;

import java.util.List;

public interface Repository<T,ID> {
    default SessionFactory getSessionFactory(){
        return SingletonConnection.getSessionFactory();
    }
    void save (T t);
    void update(T t);
    void delete(T t);
    T findById(Class<T> tClass , ID id);
    List<T> findAll(Class<T> tClass);
}
