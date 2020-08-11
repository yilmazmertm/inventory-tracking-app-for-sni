package com.yilmazmertm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class ExampleController {

    @RequestMapping({"/", ""})
    public String showHome(){
        return "home";
    }
}
