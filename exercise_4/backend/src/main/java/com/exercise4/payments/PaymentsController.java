package com.exercise4.payments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.exercise4.payments.jpa.Payment;
import com.exercise4.payments.jpa.PaymentRepository;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
public class PaymentsController {

    @Autowired
    PaymentRepository paymentRepository;

    @PostMapping("payments")
    public Payment createInvoice(@RequestBody Payment payment) {
        return paymentRepository.save(payment);
    }

    @DeleteMapping("payments/{id}")
    public void deleteInvoiceById(@PathVariable("id") Long paymentId) {
        paymentRepository.deleteById(paymentId);
    }

}
