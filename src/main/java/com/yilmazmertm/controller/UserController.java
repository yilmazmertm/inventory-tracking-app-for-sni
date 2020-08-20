package com.yilmazmertm.controller;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;
import com.yilmazmertm.service.ProductService;
import com.yilmazmertm.service.UserService;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.awt.*;
import java.util.List;

@RequestMapping({"user", "/user"})
@RestController
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
        return "homepage";
    }

    @PostMapping("/saveUser")
    public String addUser(@ModelAttribute("user") User user, Model theModel, BindingResult bindingResult) {

        String message = "You have successfully registered.Login with these information :) ";
        if (bindingResult.hasErrors()){
            message = "Oops ! Something wrong, check all the information again when adding.";
        }
        theModel.addAttribute("message", message);

        userService.saveUser(user);
        return "homepage";
    }

    @PostMapping(value = "/saveAjax", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String saveValue(@RequestParam("email") String email) {
        System.out.println("AJAX VALUE :" + email);
        return "homepage";
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
    public String doRegister(@ModelAttribute("user") User user, Model theModel, BindingResult bindingResult) {
        boolean isUnique = userService.emailValidation(user.getEmail());



        String message = "You have successfully registered.Login with these information :) ";
        if (bindingResult.hasErrors()){
            message = "Oops ! Something wrong, check all the information again when registering.";
        }
        theModel.addAttribute("message", message);
        theModel.addAttribute("isUnique", isUnique);
        user.setUserRole("ROLE_USER");
        user.setActive("true");
        userService.saveUser(user);
        return "register";
    }

    @GetMapping("/detail")
    public String userDetail(@RequestParam("userId") int theId, Model theModel) {
        User theUser = userService.getUser(theId);
        theModel.addAttribute("theUser", theUser);
        return "user-detail";
    }
}
