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
 * Created by Megan on 5/8/2017.
 */

@Controller
public class HomeController {


    @RequestMapping("/fb")
    public ModelAndView FBUserTest()
    {
        return new
                ModelAndView("fbUserTest","hello","Hello Team!");
    }
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

//    //temporary while we get the below method to work
//    @RequestMapping("/addabeersuccess")
//    public String addABeerSuccess()
//    {
//        return "addabeersuccess";
//    }

    @RequestMapping("addabeersuccess")
    public ModelAndView addABeer(@RequestParam("beerID") int beerID,
                                @RequestParam("beerDescription") String description,
                                @RequestParam("beerRating") String beerRating) {

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();
        BeerreviewEntity newBeerReview = new BeerreviewEntity();
        newBeerReview.setBeerId(beerID);
        newBeerReview.setBeerDescription(description);
        newBeerReview.setBeerRating(beerRating);

        session.save(newBeerReview);
        tx.commit();
        session.close();

        return new ModelAndView("addabeersuccess", "addingbeer", newBeerReview);
    }

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
    public ModelAndView userOptions(@RequestParam("status") String id)
    {
        System.out.println("It was " + id);

        //set the FB_LOGIN_ID to the current user, using id passed from login.jsp
        FBLogin.FB_LOGIN_ID = id;
        return new
                ModelAndView("useroptions","loginID",FBLogin.FB_LOGIN_ID);
    }
}
