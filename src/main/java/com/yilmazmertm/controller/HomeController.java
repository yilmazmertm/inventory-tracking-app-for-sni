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

import java.util.ArrayList;
import java.util.Iterator;
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
        User user = new User();
        List<User> users = productService.getAllUsers();
        List<Integer> user_ids = new ArrayList<>();
        for (User value : users) {
            user_ids.add(value.getId());
        }
        theModel.addAttribute("theProduct", product);
        theModel.addAttribute("theUsers", users);
        theModel.addAttribute("user_ids", user_ids);
        theModel.addAttribute("theUser", user);
        return "addProduct";
    }

    @PostMapping({"/saveProduct", "saveProduct"})
    public String addProduct(@ModelAttribute("theProduct") Product product,Model theModel) {
        User user = new User();
        List<User> users = productService.getAllUsers();
        System.out.println("Gelen User Id : " + product.getUser().getId());
        User userFromDatabase = productService.getUser(product.getUser().getId());

        product.setUser(userFromDatabase);
        productService.saveProduct(product);
        return "confirmation";
    }
}
