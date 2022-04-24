package com.example.bus_online_shopping_system.model.entity;

import com.example.bus_online_shopping_system.model.entity.base.BaseEntity;
import com.example.bus_online_shopping_system.model.util.Gender;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;
import org.hibernate.Hibernate;

import java.util.Objects;

@Getter
@Setter
@NoArgsConstructor
@ToString
@SuperBuilder(toBuilder = true)
@Table(name = "Orders")
@Entity
public class Order extends BaseEntity<Integer> {
    private String name;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    @ManyToOne
    private Ticket ticket;

    @ManyToOne
    private User user;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        Order order = (Order) o;
        return getId() != null && Objects.equals(getId(), order.getId());
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
