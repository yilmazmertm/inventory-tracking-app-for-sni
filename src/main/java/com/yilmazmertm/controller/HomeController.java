package com.yilmazmertm.controller;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;
import com.yilmazmertm.service.ProductService;
import com.yilmazmertm.service.UserService;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@RequestMapping({"", "/"})
@Controller
public class HomeController {

    private final ProductService productService;
    private final UserService userService;

    public HomeController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @RequestMapping({"", "/"})
    public String showHomePage() {
        return "home";
    }

    @GetMapping({"addProduct", "/addProduct"})
    public String showProductForm(Model theModel) {
        Product product = new Product();
        List<User> users = userService.getAllUsers();
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

        User userFromDatabase = userService.getUser(product.getUser().getId());
        product.setCreatedBy("admin");
        product.setOwner(userFromDatabase.getFullName());
        product.setUser(userFromDatabase);
        productService.saveProduct(product);
        return "confirmation";
    }

    @GetMapping("/list")
    public String listProducts(Model theModel) {
        List<Product> theProducts = productService.getAllProducts();
        for (Product theProduct : theProducts) {
            if (theProduct.getUser().getId() == (0)) {
                User user = new User();
                user.setId(99);
                user.setUserName("Removed User");
                user.setUserLastName("Removed User");
                user.setUserRole("Left");
                theProduct.setUser(user);
            }
            System.out.println("girmedi");
        }

        theModel.addAttribute("products", theProducts);
        return "list-products";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("productId") int theId, Model theModel) {
        List<User> users = userService.getAllUsers();
        List<Integer> user_ids = new ArrayList<>();
        for (User value : users) {
            user_ids.add(value.getId());
        }
        theModel.addAttribute("theUsers", users);
        theModel.addAttribute("user_ids", user_ids);
        Product theProduct = productService.getProduct(theId);
        theModel.addAttribute("theProduct", theProduct);
        return "addProduct";
    }

    @GetMapping("/delete")
    public String deleteProduct(@RequestParam("productId") int theId) {
        productService.deleteProduct(theId);
        return "redirect:/";
    }
}
