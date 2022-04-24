package com.example.bus_online_shopping_system.model.repository;

import com.example.bus_online_shopping_system.model.entity.Ticket;

import java.sql.Date;
import java.util.List;

public interface TicketRepository {
    List<Ticket> SearchTicket(Date date, String source, String destination);
}
