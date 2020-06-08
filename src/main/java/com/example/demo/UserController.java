package com.example.demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.example.demo.dao.UserRepo;
import com.example.demo.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
    public RedirectView addUser(User user) {
        // System.out.println(user);
        repo.save(user);
        return new RedirectView("/login");
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
        // System.out.println(foundUser);
        if(foundUser == null)
        {
            ModelAndView mv = new ModelAndView("login.jsp");
            String error = "User doesn't exist!";
            mv.addObject("error", error);
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