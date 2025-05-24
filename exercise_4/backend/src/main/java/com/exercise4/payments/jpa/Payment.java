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
@Table(name = "PAYMENT")
@Getter
public class Payment {
    @Id
    @SequenceGenerator(name = "PAYMENT_SEQUENCE_GENERATOR", sequenceName = "PAYMENT_SEQ", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PAYMENT_SEQUENCE_GENERATOR")
    @Column(name = "PAYMENT_ID")
    Long id;

    @Column(name = "PAYMENT_DATE")
    Date date;

    @Column(name = "PAYMENT_AMOUNT")
    BigDecimal amount;

    @Column(name = "CURRENCY")
    String currency;

    @Column(name = "INVOICE_ID")
    Long invoiceId;
}
