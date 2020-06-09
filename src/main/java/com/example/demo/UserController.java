package com.example.demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.example.demo.dao.UserRepo;
import com.example.demo.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class UserController {

    @Autowired
    UserRepo repo;
    
    // Return register page
    @GetMapping("/register")
    public String register(HttpServletRequest req) {   
        HttpSession session = req.getSession();
        if(session.getAttribute("user") != null)
            return "redirect:/";
        return "register.jsp";
    }

    // Validate info and register a user!
    @PostMapping(value = "/register", produces = {"application/json"})
    public ModelAndView addUser(User user, @RequestParam("repeatedPassword") String repPassword) 
    {
        // Block for checking if the user with the entered username already exists
        // If user exists then return an error and don't even continue validating the input parameters and don't
        // save the old inputed data (because the user already exists)
        User fuser = repo.findByUsername(user.getUsername());
        if(fuser != null)
        {
            ModelAndView mv = new ModelAndView("register.jsp");
            String error = "User '" + user.getUsername() + "' already exists!";
            mv.addObject("error", error);
            return mv;
        }


        ModelAndView mv = new ModelAndView("register.jsp");
        StringBuilder stringBuilder = new StringBuilder();

        // ErrorMessageGenerators
        if(user.getUsername() == "")
            stringBuilder.append("Username is empty!<br>");

        if(user.getPassword() == "")
            stringBuilder.append("Password is empty!<br>");

        if(!user.getPassword().equals(repPassword))
            stringBuilder.append("Password and repeated password does not match!");

        // If stringBuilder is not empty (there are some error) create modelview objects and return the modelandview
        if(!stringBuilder.toString().equals(""))
        {
            mv.addObject("error", stringBuilder.toString());

            // These two lines are for saving input data so after failed attempt the old data would be automatically saved
            // so it a user doesn't have to input all the info again
            mv.addObject("oldUsername", user.getUsername());
            mv.addObject("oldPassword", user.getPassword());

            return mv;
        }

        repo.save(user);

        /// CREATE SUCCESS fake PAGE that notifies about successful registration and redirects to /login! ///

        return new ModelAndView(new RedirectView("/login"));
        // return new ModelAndView("login.jsp"); // old (only sent a view, url was still /register and not /login after the registration)
        // return new ModelAndView("/login"); // auto login?
    }

    // Return a login page
    @GetMapping("/login")
    public String login(HttpServletRequest req) {
        HttpSession session = req.getSession();
        if(session.getAttribute("user") != null)
            return "redirect:/";
        return "login.jsp";
    }

    // Verifyies login info and logs in
    @PostMapping(value = "/login", produces = {"application/json"})
    public ModelAndView login(User user, HttpServletRequest req) 
    {
        HttpSession session = req.getSession();
        User foundUser = repo.findByUsername(user.getUsername());
        
        if(foundUser == null) // if the user does not exist
        {
            ModelAndView mv = new ModelAndView("login.jsp");
            String error = "User doesn't exist!";
            mv.addObject("error", error);
            mv.addObject("oldUsername", user.getUsername());
            return mv;
        }
        else
        {
            // System.out.println(u.getPassword() + '|' + user.getPassword());
            // System.out.println(u.getPassword().equals(user.getPassword()));
            if(foundUser.getPassword().equals(user.getPassword()))
            {
                session.setAttribute("user", user);
                return new ModelAndView("redirect:/");
            }
            else
            {
                ModelAndView mv = new ModelAndView("login.jsp");
                String error = "Incorrect password!";
                mv.addObject("error", error);
                mv.addObject("oldUsername", user.getUsername());
                return mv;
            }
        }
    }

    // Fake LOGOUT page (for sending POST request when trying to logout in browser url by ../logout)
    @GetMapping("/logout")
    public String logoutGet() {
        return "fakeLogout.jsp";
    }

    // LOGOUT
    @PostMapping("/logout")
    public RedirectView logoutPost(HttpServletRequest req) {
        HttpSession session = req.getSession();
        // System.out.println(session.getAttribute("user"));
        session.removeAttribute("user");

        return new RedirectView("/");
    }
}