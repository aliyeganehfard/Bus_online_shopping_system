package com.example.bus_online_shopping_system.model.repository;

import com.example.bus_online_shopping_system.model.util.SingletonConnection;
import jakarta.persistence.NoResultException;

public interface LoginBase<T> {
    default T login(Class<T>  tClass, String userName , String password){
        var sessionFactory = SingletonConnection.getSessionFactory();
        try(var session = sessionFactory.openSession()){
            try{
                var criteriaBuilder = session.getCriteriaBuilder();
                var criteriaQuery = criteriaBuilder.createQuery(tClass);
                var root = criteriaQuery.from(tClass);
                var userNameEqual = criteriaBuilder.equal(root.get("username"),userName);
                var passwordEqual = criteriaBuilder.equal(root.get("password"),password);

                var query = criteriaQuery
                        .select(root)
                        .where(criteriaBuilder.and(userNameEqual,passwordEqual));
                return session.createQuery(query).getSingleResult();
            }catch (NoResultException e){
            }
        }
        return null;
    }
}
