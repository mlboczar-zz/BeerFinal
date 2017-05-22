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
    public ModelAndView login()
    {
        return new
                ModelAndView("login","hello","Hello Team!");
    }
    @RequestMapping("/addABeer")
    public ModelAndView addABeer()
    {
        return new
                ModelAndView("addabeer","hello","Hello Team!");
    }
    @RequestMapping("/addABeerSuccess")
    public ModelAndView addABeerSuccess()
    {
        return new
                ModelAndView("addabeersuccess","hello","Hello Team!");
    }
    @RequestMapping("/findABeer")
    public ModelAndView findABeer()
    {
        return new
                ModelAndView("findabeer","hello","Hello Team!");
    }
    @RequestMapping("/findABeerResult")
    public ModelAndView findABeerResult()
    {
        return new
                ModelAndView("findabeerresult","hello","Hello Team!");
    }
    @RequestMapping("/userOptions")
    public ModelAndView userOptions()
    {
        return new
                ModelAndView("useroptions","hello","Hello Team!");
    }
}
