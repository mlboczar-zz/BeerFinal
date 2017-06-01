package com.grandcircus.spring.controller;

import com.grandcircus.spring.models.BeerEntity;
import com.grandcircus.spring.models.BeerreviewEntity;
import com.grandcircus.spring.models.ReviewList;
import com.grandcircus.spring.models.UsersEntity;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.swing.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Megan on 5/8/2017.
 */

@Controller
public class HomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String addUserInput() {
        return "userage";
    }

    @RequestMapping(value = "/verifyage", method = RequestMethod.POST)
    public String login(@RequestParam("age") Integer age) {
        final Integer AGELIMIT = 21;
        if (age >= AGELIMIT && age <= 110) {
            return "useroptions";
        } else {
            return "userage";
        }
    }

    @RequestMapping("/useroptions")
    public String userOptions(){
        return "useroptions";
    }

    @RequestMapping("addabeer")
    public String addABeer() {

        return "addabeer";
    }

    @RequestMapping("addabeersuccess")
    public ModelAndView addABeer(@RequestParam("brewer") String brewer,
                                 @RequestParam("beerName") String beerName,
                                 @RequestParam("beerType") String beerType,
                                 @RequestParam("beerFlavors") String beerFlavors) {

        if(brewer.length()<1 || beerName.length()<1||beerType.length()<1||beerFlavors.length()<1){
            return new ModelAndView("addabeer", "message", "Please fill out all fields");
        }

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();
        BeerEntity newBeer = new BeerEntity();
        newBeer.setBrewer(brewer);
        newBeer.setBeerName(beerName);
        newBeer.setBeerType(beerType);
        newBeer.setBeerFlavors(beerFlavors);
        session.save(newBeer);
        tx.commit();
        session.close();
        return new
                ModelAndView("addabeersuccess", "addbeer", newBeer);
    }

    @RequestMapping("/reviewabeer")
    public String reviewABeer(@RequestParam(value="status") String id,
                              @RequestParam(value="name") String name,
                              Model model) {



        //Add the User to the Database if they are not there
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session2 = sessionFact.openSession();

        Transaction tx = session2.beginTransaction();
        UsersEntity newUser = new UsersEntity();

        newUser.setUserId(id);
        newUser.setUserName(name);

        try {
            session2.save(newUser);
            tx.commit();
            session2.close();
        } catch (Exception e){
            session2.close();

        }
        //User has been added if they weren't already there

        Session session = createSession();
        Criteria c = session.createCriteria(BeerEntity.class);
        ArrayList<BeerEntity> beersList = (ArrayList<BeerEntity>) c.list();
        model.addAttribute("beersList", beersList);
        model.addAttribute("status", id);
        session.close();

        return "reviewabeer";
    }

    @RequestMapping("reviewabeersuccess")
    public ModelAndView reviewABeer(@RequestParam("beerID") int beerID,
                                    @RequestParam("beerDescription") String description,
                                    @RequestParam("userID") String id,
                                    @RequestParam("beerRating") String beerRating) {

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();
        BeerreviewEntity newBeerReview = new BeerreviewEntity();
        newBeerReview.setBeerId(beerID);
        newBeerReview.setBeerDescription(description);
        newBeerReview.setBeerRating(beerRating);
        newBeerReview.setUserId(id);

        session.save(newBeerReview);
        tx.commit();
        session.close();

        return new ModelAndView("reviewabeersuccess", "addingbeer", newBeerReview);
    }

    @RequestMapping("/findabeer")
    public String findABeer(@RequestParam("status") String status,
                            @RequestParam("name") String name, Model model) {
        
        return "findabeer";
    }

    @RequestMapping("searchbyname")
    public String searchByName(@RequestParam("beerName") String beerName, Model model) {
        Session session = createSession();
        Criteria c = session.createCriteria(BeerEntity.class);
        c.add(Restrictions.like("beerName", "%" + beerName + "%"));
        ArrayList<BeerEntity> beerList = (ArrayList<BeerEntity>) c.list();
        model.addAttribute("bList", beerList);
        session.close();

        return "findabeerresult";
    }

    @RequestMapping("searchbybrewer")
    public String searchByBrewer(@RequestParam("brewer") String brewer, Model model) {
        Session session = createSession();
        Criteria c = session.createCriteria(BeerEntity.class);
        c.add(Restrictions.like("brewer", "%" + brewer + "%"));
        ArrayList<BeerEntity> beerList = (ArrayList<BeerEntity>) c.list();
        model.addAttribute("bList", beerList);
        session.close();

        return "findabeerresult";
    }

    @RequestMapping("searchbybeertype")
    public String searchByBeerType(@RequestParam("beerType") String beerType, Model model) {
        Session session = createSession();
        Criteria c = session.createCriteria(BeerEntity.class);
        c.add(Restrictions.like("beerType", "%" + beerType + "%"));
        ArrayList<BeerEntity> beerList = (ArrayList<BeerEntity>) c.list();
        model.addAttribute("bList", beerList);
        session.close();

        return "findabeerresult";
    }

    @RequestMapping("/seemybeers")
    public String seeMyBeers(@RequestParam("status") String id,
                             Model model) {

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        session.beginTransaction();

        //using SQl query
        Query query = session.createSQLQuery("select br.beerDescription, br.beerRating, b.brewer, b.beerName, b.beerType, b.beerFlavors from beerreview as br, beer as b where br.beerID = b.beerID and br.userID=:userID").setResultTransformer(Transformers.aliasToBean(ReviewList.class));

        query.setString("userID", id);
        List<ReviewList> beerReviewList = query.list();
        model.addAttribute("bList", beerReviewList);
        session.close();

        return "seemybeers";
    }

    public static Session createSession() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        session.beginTransaction();
        return session;
    }
}

