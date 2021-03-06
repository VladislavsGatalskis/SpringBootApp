package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
    
    @GetMapping(value="/")
    public String home() {
        return "home.jsp";
    }
    
    @GetMapping("/rest/docker/hello")
    @ResponseBody
    public String hello() {
        return "Hey man!";
    }
}