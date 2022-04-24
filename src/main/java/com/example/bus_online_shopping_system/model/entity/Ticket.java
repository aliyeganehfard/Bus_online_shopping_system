package com.example.bus_online_shopping_system.model.entity;

import com.example.bus_online_shopping_system.model.entity.base.BaseEntity;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;
import org.hibernate.Hibernate;

import java.sql.Date;
import java.sql.Time;
import java.util.Objects;

@Getter
@Setter
@NoArgsConstructor
@ToString
@SuperBuilder(toBuilder = true)
@Entity
public class Ticket extends BaseEntity<Integer> {
    private String source;
    private String destination;
    private Date dateOfMoving;
    private Time timeOfMoving;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        Ticket ticket = (Ticket) o;
        return getId() != null && Objects.equals(getId(), ticket.getId());
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
