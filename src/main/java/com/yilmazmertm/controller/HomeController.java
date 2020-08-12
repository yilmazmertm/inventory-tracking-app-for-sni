package com.yilmazmertm.controller;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;
import com.yilmazmertm.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping({"", "/"})
@Controller
public class HomeController {

    private ProductService productService;

    public HomeController(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping({"", "/"})
    public String showProductForm(Model theModel) {
        Product product = new Product();
        List<User> users = productService.getAllUsers();
        theModel.addAttribute("theProduct", product);
        theModel.addAttribute("theUsers", users);
        return "addProduct";
    }

    @PostMapping({"/saveProduct", "saveProduct"})
    public String addProduct(@ModelAttribute("theProduct") Product product, ModelMap model) {
        productService.saveProduct(product);
        return "confirmation";
    }
}
