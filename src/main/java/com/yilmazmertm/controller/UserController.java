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

import java.util.ArrayList;
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
        return "redirect:/#listUserContainer";
    }


    //SAVE WITH AJAX
    //SAVE WITH AJAX
    @PostMapping(value = "/saveAjax", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String saveValue(@RequestParam("userName") String userName,@RequestParam("userLastName") String userLastName,
                            @RequestParam("userRole") String userRole,@RequestParam("team") String team,
                            @RequestParam("email") String email,@RequestParam("active") String active,@RequestParam("password") String password) {
        User user = new User();
        user.setUserName(userName);user.setUserLastName(userLastName);user.setUserRole(userRole);
        user.setTeamMember(team);user.setEmail(email);user.setActive(active);user.setPassword(password);

        userService.saveUser(user);
        return "/";
    }

    @RequestMapping(value = "/saveAjaxJson", method = RequestMethod.POST)
    @ResponseBody
    public boolean saveValueJson(@RequestBody User user) {
        boolean result = userService.emailValidation(user.getEmail());
        if (result){
            userService.saveUser(user);
        }else {
            return false;
        }
        return true;
    }
    //SAVE WITH AJAX
    //SAVE WITH AJAX

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("userId") int theId, Model theModel) {
        User theUser = userService.getUserForUpdate(theId);
        theModel.addAttribute("user", theUser);
        return "addUser";
    }

    @GetMapping("/delete")
    public String deleteUser(@RequestParam("userId") int theId) {
        userService.deleteUser(theId);
        return "redirect:/#listUserContainer";
    }

    @GetMapping({"/getRegister", "getRegister"})
    public String getRegistirationForm(Model theModel) {
        User user = new User();
        theModel.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/doRegister")
    public String doRegister(@ModelAttribute("user") User user, Model theModel, BindingResult bindingResult) {
        boolean result = userService.emailValidation(user.getEmail());
        System.out.println(result);
        String message = "";
        if (result) {
            message = "You have successfully registered.Login with these information :) ";
            user.setUserRole("ROLE_USER");
            user.setActive("true");
            userService.saveUser(user);
        }else {
            message = "E-mail is already taken, please change.";
            if (bindingResult.hasErrors()){
                message = "oops... something wrong, please check your info.";
            }
        }
        theModel.addAttribute("message", message);
        return "register";
    }

    @GetMapping("/detail")
    public String userDetail(@RequestParam("userId") int theId, Model theModel) {
        User theUser = userService.getUser(theId);
        theModel.addAttribute("theUser", theUser);
        return "user-detail";
    }

    @RequestMapping("/userNamesAutoComplete")
    @ResponseBody
    public List<String> userNameAutocomplete(@RequestParam(value = "term", required = false, defaultValue = "") String term){
        List<String> suggestions;
        suggestions = userService.getUserNameSuggestions(term);
        System.out.println(suggestions);
        return suggestions;
    }
}
