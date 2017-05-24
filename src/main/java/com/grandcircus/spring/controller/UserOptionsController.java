package com.grandcircus.spring.controller;


import com.grandcircus.spring.models.BeerEntity;
import com.grandcircus.spring.models.BeerreviewEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


/**
 * Created by seandunn92 on 5/24/17.
 */

@Controller
public class UserOptionsController {

    @RequestMapping("/useroptions")
    public ModelAndView userOptions(@RequestParam("status") String id ,  @RequestParam("userName") String name)
    {
        System.out.println("It was " + id);

        //set the FB_LOGIN_ID to the current user, using id passed from login.jsp
        FBLogin.FB_LOGIN_ID = id;
        FBLogin.FB_LOGIN_NAME = name;
        return new
                ModelAndView("useroptions","loginName",FBLogin.FB_LOGIN_NAME);
    }

}
