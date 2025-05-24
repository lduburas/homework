package com.exercise4.payments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.exercise4.payments.jpa.Invoice;
import com.exercise4.payments.jpa.InvoiceRepository;
import com.exercise4.payments.jpa.Payment;
import com.exercise4.payments.jpa.PaymentRepository;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
public class InvoicesController {

    @Autowired
    InvoiceRepository invoiceRepository;

    @Autowired
    PaymentRepository paymentRepository;

    @GetMapping("invoices")
    Iterable<Invoice> invoices() {
        return invoiceRepository.findAll();
    }

    @PostMapping("invoices")
    public Invoice createInvoice(@RequestBody Invoice invoice) {
        return invoiceRepository.save(invoice);
    }

    @DeleteMapping("invoices/{id}")
    public void deleteInvoiceById(@PathVariable("id") Long invoiceId) {
        invoiceRepository.deleteById(invoiceId);
    }

    @GetMapping("invoices/{id}/payments")
    public Iterable<Payment> getMethodName(@PathVariable("id") Long invoiceId) {
        return paymentRepository.findByInvoiceId(invoiceId);
    }

}
