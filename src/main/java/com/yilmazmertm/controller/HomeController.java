package com.yilmazmertm.controller;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;
import com.yilmazmertm.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

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
        List<User> users = productService.getAllUsers();
        List<Integer> user_ids = new ArrayList<>();
        for (User value : users) {
            user_ids.add(value.getId());
        }
        theModel.addAttribute("theProduct", product);
        theModel.addAttribute("theUsers", users);
        theModel.addAttribute("user_ids", user_ids);
        return "addProduct";
    }

    @PostMapping({"/saveProduct", "saveProduct"})
    public String addProduct(@ModelAttribute("theProduct") Product product,Model theModel) {
        User userFromDatabase = productService.getUser(product.getUser().getId());
        product.setCreatedBy(userFromDatabase.getFullName());
        product.setUser(userFromDatabase);
        productService.saveProduct(product);
        return "confirmation";
    }

    @RequestMapping({"/addUser", "addUser"})
    public String showUserForm(Model theModel) {
        User user = new User();
        theModel.addAttribute("userAddModel", user);
        return "addUser";
    }

    @PostMapping({"/saveUser", "saveUser"})
    public String addUser(@ModelAttribute("userAddModel") User user, Model theModel) {
        user.setUserRole("ROLE_USER");
       productService.saveUser(user);
       return "confirmation";
    }

    @GetMapping("/list")
    public String listProducts(Model theModel) {
        List<Product> theProducts = productService.getAllProducts();
        theModel.addAttribute("products", theProducts);
        return "list-products";
    }

}
