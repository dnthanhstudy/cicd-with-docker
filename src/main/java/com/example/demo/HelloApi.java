package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author thanhdn15
 */
@RestController
@RequestMapping("public/hello")
public class HelloApi {

  @GetMapping
  public String hello(){
    return "Hello World, Hello Thanh nha";
  }
}
