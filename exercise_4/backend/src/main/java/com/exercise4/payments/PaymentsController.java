package com.exercise4.payments;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PaymentsController {

    @GetMapping("invoice")
    String invoice() {
        return "Big invoice3";
    }

}
