package com.grandcircus.spring.controller;

import com.grandcircus.spring.models.BeerEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @RequestMapping("/addabeer")
    public String addABeer()
    {
        return "addabeer";
    }

    //temporary while we get the below method to work
    @RequestMapping("/addabeersuccess")
    public String addABeerSuccess()
    {
        return "addabeersuccess";
    }

//    @RequestMapping("addabeersuccess")
//    public ModelAndView addABeer(@RequestParam("beerName") String beerName,
//                                @RequestParam("location") String location,
//                                @RequestParam("beerType") String beerType,
//                                @RequestParam("beerFlavors") String beerFlavors,
//                                @RequestParam("beerDescription") String beerDescription,
//                                @RequestParam("beerRating") String beerRating) {
//
//        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
//        SessionFactory sessionFact = cfg.buildSessionFactory();
//        Session session = sessionFact.openSession();
//        Transaction tx = session.beginTransaction();
//        BeerEntity newBeer = new BeerEntity();
//        newBeer.setBeerName(beerName);
//        newBeer.setLocation(location);
//        newBeer.setBeerType(beerType);
//        newBeer.setBeerFlavors(beerFlavors);
//        newBeer.setDescription(beerDescription);
//        newBeer.setBeerRating(beerRating);
//
//        session.save(newBeer);
//        tx.commit();
//        session.close();
//
//        return new ModelAndView("addabeersuccess", "addingbeer", newBeer);
//    }

    @RequestMapping("/findabeer")
    public ModelAndView findABeer()
    {
        return new
                ModelAndView("findabeer","hello","Hello Team!");
    }

    @RequestMapping("/findabeerresult")
    public ModelAndView findABeerResult()
    {
        return new
                ModelAndView("findabeerresult","hello","Hello Team!");
    }

    @RequestMapping("/useroptions")
    public ModelAndView userOptions()
    {
        return new
                ModelAndView("useroptions","hello","Hello Team!");
    }
}
