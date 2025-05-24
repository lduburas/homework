package com.exercise4.payments.jpa;

import java.math.BigDecimal;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Getter;

@Entity
@Table(name = "INVOICE")
@Getter
public class Invoice {
    @Id
    @SequenceGenerator(name = "INVOICE_SEQUENCE_GENERATOR", sequenceName = "INVOICE_SEQ", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "INVOICE_SEQUENCE_GENERATOR")
    @Column(name = "INVOICE_ID")
    Long id;

    @Column(name = "INVOICE_DATE")
    Date date;

    @Column(name = "INVOICE_AMOUNT")
    BigDecimal amount;

    @Column(name = "CURRENCY")
    String currency;
}
