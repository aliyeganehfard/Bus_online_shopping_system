package com.example.bus_online_shopping_system.controller.impl;

import com.example.bus_online_shopping_system.controller.TicketService;
import com.example.bus_online_shopping_system.model.entity.Ticket;
import com.example.bus_online_shopping_system.model.repository.impl.TicketRepositoryImpl;

import java.sql.Date;
import java.util.List;

public class TicketServiceImpl extends ServiceImpl<TicketRepositoryImpl, Ticket,Integer> implements TicketService {
    private TicketRepositoryImpl ticketRepository;
    public TicketServiceImpl() {
        super(new TicketRepositoryImpl());
        this.ticketRepository = new TicketRepositoryImpl();
    }

    @Override
    public List<Ticket> SearchTicket(Date date, String source, String destination) {
        return ticketRepository.SearchTicket(date,source,destination);
    }
}
