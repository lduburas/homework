package com.exercise4.payments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.exercise4.payments.jpa.Invoice;
import com.exercise4.payments.jpa.InvoiceRepository;

@RestController
public class PaymentsController {

    @Autowired
    InvoiceRepository repository;

    @GetMapping("invoices")
    Iterable<Invoice> invoices() {
        return repository.findAll();
    }

}
