package com.grandcircus.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Megan on 5/8/2017.
 */

@Controller
public class HomeController {

    @RequestMapping("/")
    public ModelAndView helloWorld()
    {
        return new
                ModelAndView("login","hello","Hello Team!");
    }
}
