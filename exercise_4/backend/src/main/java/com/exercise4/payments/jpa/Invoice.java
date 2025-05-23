package com.exercise4.payments.jpa;

import java.math.BigDecimal;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;

@Entity
@Table(name = "INVOICE")
@Getter
public class Invoice {
    @Id
    @Column(name = "INVOICE_ID")
    Long id;

    @Column(name = "INVOICE_DATE")
    Date date;

    @Column(name = "INVOICE_AMOUNT")
    BigDecimal amount;

    @Column(name = "CURRENCY")
    String currency;
}
