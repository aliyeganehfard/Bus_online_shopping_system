package com.example.bus_online_shopping_system.model.repository.impl;

import com.example.bus_online_shopping_system.controller.impl.TicketServiceImpl;
import com.example.bus_online_shopping_system.model.entity.Ticket;
import com.example.bus_online_shopping_system.model.entity.User;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.Date;
import java.sql.Time;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.*;

class TicketRepositoryImplTest {
    private TicketServiceImpl ticketService;
    private Ticket ticket;

    @BeforeEach
    void beforeEach() {
        ticketService = new TicketServiceImpl();
//        arrange
        this.ticket = Ticket.builder()
                .id(null)
                .source("a")
                .destination("b")
                .dateOfMoving(Date.valueOf("2020-02-02"))
                .timeOfMoving(Time.valueOf("10:10:10"))
                .build();
    }

    @Test
    void save() {
//        act
        ticketService.save(ticket);
        var load = ticketService.findById(Ticket.class, ticket.getId());
//        assert
        Assertions.assertThat(load).isNotNull();
    }

    @Test
    void update() {
//        act
        ticketService.save(ticket);
        ticket.setDestination("b");
        ticketService.update(ticket);
        var load = ticketService.findById(Ticket.class, ticket.getId());
//        assert
        Assertions.assertThat(ticket).isEqualTo(load);
    }

    @Test
    void delete() {
//        act
        ticketService.save(ticket);
        ticketService.delete(ticket);
//        assert
        assertNull(ticketService.findById(Ticket.class, ticket.getId()));
    }

    @Test
    void findById() {
//        act
        ticketService.save(ticket);
        var load = ticketService.findById(Ticket.class, ticket.getId());
//        assert
        Assertions.assertThat(ticket).isEqualTo(load);
    }

    @Test
    void findAll() {
//        act
        var size = ticketService.findAll(Ticket.class).size();
        ticketService.save(ticket);
        size++;
//        assert
        Assertions.assertThat(size).isEqualTo(ticketService.findAll(Ticket.class).size());
    }

    @Test
    void searchTicket() {
//        act
        ticketService.save(ticket);
        var load = ticketService.SearchTicket(Date.valueOf("2020-02-02"), "a", "b");
        var all = ticketService.findAll(Ticket.class).stream()
                .filter(t -> t.getDateOfMoving().equals(Date.valueOf("2020-02-02")) &&
                        t.getSource().equals("a") && t.getDestination().equals("b"))
                .collect(Collectors.toList());
//        assert
        Assertions.assertThat(all).isEqualTo(load);
    }
}