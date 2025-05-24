package com.exercise4.payments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.exercise4.payments.jpa.Invoice;
import com.exercise4.payments.jpa.InvoiceRepository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
public class PaymentsController {

    @Autowired
    InvoiceRepository repository;

    @GetMapping("invoices")
    Iterable<Invoice> invoices() {
        return repository.findAll();
    }

    @PostMapping("invoices")
    public Invoice createInvoice(@RequestBody Invoice invoice) {
        return repository.save(invoice);
    }

    @DeleteMapping("invoices/{id}")
    public void deleteInvoiceById(@PathVariable("id") Long invoiceId) {
        repository.deleteById(invoiceId);
    }

}
