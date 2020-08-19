package com.yilmazmertm.controller;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;
import com.yilmazmertm.service.ProductService;
import com.yilmazmertm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping({"user", "/user"})
@Controller
public class UserController {

    private final ProductService productService;
    private final UserService userService;

    public UserController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/list")
    public String listUsers(Model theModel) {
        List<User> users = userService.getAllUsers();
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
        userService.saveUser(user);
        return "redirect:/user/list";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("userId") int theId, Model theModel) {
        User theUser = userService.getUserForUpdate(theId);
        theModel.addAttribute("user", theUser);
        return "addUser";
    }

    @GetMapping("/delete")
    public String deleteUser(@RequestParam("userId") int theId) {
        userService.deleteUser(theId);
        return "redirect:/user/list";
    }

    @GetMapping({"/getRegister", "getRegister"})
    public String getRegistirationForm(Model theModel) {
        User user = new User();
        theModel.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/doRegister")
    public String doRegister(@ModelAttribute("user") User user, Model theModel) {
        user.setUserRole("ROLE_USER");
        user.setActive("true");
        userService.saveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/detail")
    public String userDetail(@RequestParam("userId") int theId, Model theModel) {
        User theUser = userService.getUser(theId);
        theModel.addAttribute("theUser", theUser);
        return "user-detail";
    }
}
