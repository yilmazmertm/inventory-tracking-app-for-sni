package com.yilmazmertm.controller;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;
import com.yilmazmertm.service.ProductService;
import com.yilmazmertm.service.UserService;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.awt.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;
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

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss.SSS");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    @RequestMapping({"", "/"})
    public String showHomePage(Model theModel) {
        User user = new User();
        theModel.addAttribute("user", user);

        List<User> users = userService.getAllUsers();
        theModel.addAttribute("users", users);

        List<Product> theProducts = productService.getAllProducts();
        theModel.addAttribute("products", theProducts);
        return "homepage";
    }

    // Try To return an model with ajax
    @RequestMapping(value = "/returnUserList", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<User> returnUserList() {
        List<User> users = userService.getAllUsers();
        return users;
    }
    // Try To return an model with ajax

    @GetMapping({"addProduct", "/addProduct"})
    public String showProductForm(Model theModel) {
        Product product = new Product();
        List<User> users = userService.getAllUsers();
        theModel.addAttribute("theProduct", product);
        theModel.addAttribute("theUsers", users);
        return "addProductwithBootstrap";
    }

    @PostMapping("/saveProduct")
    public String addProduct(@ModelAttribute("theProduct") Product product,Model theModel, Authentication authentication) {

        User userFromDatabase = userService.getUserForUpdate(product.getUser().getId());
        if (product.getId() == 0){
            product.setCreatedBy(authentication.getName());
        } else{
            product.setUpdatedBy(authentication.getName());
        }
        product.setOwner(userFromDatabase.getFullName());
        product.setUser(userFromDatabase);
        productService.saveProduct(product);
        return "redirect:/#listProductsContainer";
    }

    @GetMapping("/list")
    public String listProducts(Model theModel) {
        List<Product> theProducts = productService.getAllProducts();
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
        theProduct.setCreatedBy(theProduct.getCreatedBy());
        theModel.addAttribute("theProduct", theProduct);
        return "addProductwithBootstrap";
    }

    @GetMapping("/delete")
    public String deleteProduct(@RequestParam("productId") int theId) {
        productService.deleteProduct(theId);
        return "redirect:/#listProductsContainer";
    }

    @GetMapping("/detail")
    public String productDetail(@RequestParam("productId") int theId, Model theModel) {
        Product theProduct = productService.getProductDetail(theId);
        theModel.addAttribute("theProduct", theProduct);
        return "product-detail";
    }
}