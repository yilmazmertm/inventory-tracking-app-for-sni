package com.yilmazmertm.controller;

import com.yilmazmertm.entity.User;
import com.yilmazmertm.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping({"user", "/user"})
@Controller
public class UserController {

    ProductService productService;
    public UserController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/list")
    public String listUsers(Model theModel) {
        List<User> users = productService.getAllUsers();
        theModel.addAttribute("users", users);
        return "list-users";
    }

    @GetMapping({"/addUser", "addUser"})
    public String showUserForm(Model theModel) {
        User user = new User();
        theModel.addAttribute("user", user);
        return "addUser";
    }

    @PostMapping("/saveUser")
    public String addUser(@ModelAttribute("user") User user, Model theModel) {
        // ıd burda 0 oyüzden update değilde save yapıyor
        System.out.println(user.getId());
        System.out.println(user.getFullName());
        productService.saveUser(user);
        return "confirmation";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("userId") int theId, Model theModel) {
        User theUser = productService.getUserForUpdate(theId);
        // Buraya geliyor data sıkıntı yok
        theModel.addAttribute("user", theUser);
        return "addUser";
    }

    @GetMapping("/delete")
    public String deleteUser(@RequestParam("userId") int theId) {
        productService.deleteUser(theId);
        return "home";
    }
}
