package com.example.bus_online_shopping_system.model.repository.impl;

import com.example.bus_online_shopping_system.model.entity.Ticket;
import com.example.bus_online_shopping_system.model.repository.TicketRepository;

import java.sql.Date;
import java.util.List;

public class TicketRepositoryImpl extends RepositoryImpl<Ticket,Integer> implements TicketRepository {
    @Override
    public List<Ticket> SearchTicket(Date date, String source, String destination) {
//        com.example.bus_online_shopping_system.model.entity.
        try(var session = getSessionFactory().openSession()){
            try {
                return session
                        .createQuery("select t from Ticket t " +
                                "where t.dateOfMoving = :date and t.source = :source and t.destination = :destination",Ticket.class)
                        .setParameter("date",date)
                        .setParameter("source",source)
                        .setParameter("destination",destination)
                        .list();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return null;
    }
}
