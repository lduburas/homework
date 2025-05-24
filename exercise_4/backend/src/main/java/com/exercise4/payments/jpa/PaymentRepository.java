package com.exercise4.payments.jpa;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface PaymentRepository extends CrudRepository<Payment, Long> {

    List<Payment> findByInvoiceId(Long invoiceId);

}