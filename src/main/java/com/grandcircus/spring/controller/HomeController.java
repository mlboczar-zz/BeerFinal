package com.grandcircus.spring.controller;

import com.grandcircus.spring.models.BeerEntity;
import com.grandcircus.spring.models.BeerreviewEntity;
import com.grandcircus.spring.models.ReviewList;
import com.grandcircus.spring.models.UsersEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.hibernate.Query;

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

    @RequestMapping("/fb")
    public String FBUserTest() {
        return "fbUserTest";
    }

    @RequestMapping(value = "/verifyage", method = RequestMethod.POST)
    public String login(@RequestParam("age") Integer age) {
        final Integer AGELIMIT = 21;
        if (age >= AGELIMIT) {
            return "useroptions";
        } else {
            return "userage";
        }
    }

    @RequestMapping("/reviewabeer")
    public String reviewABeer() {
       
        return "reviewabeer";
    }

    @RequestMapping("reviewabeersuccess")
    public ModelAndView reviewABeer(@RequestParam("beerID") int beerID,
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
        newBeerReview.setUserId(FBLogin.FB_LOGIN_ID);

        session.save(newBeerReview);
        tx.commit();
        session.close();

        return new ModelAndView("reviewabeersuccess", "addingbeer", newBeerReview);
    }

    @RequestMapping("/seemybeers")
    public String seeMyBeers(Model model) {

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        session.beginTransaction();
        Query query = session.createSQLQuery("select br.beerDescription, br.beerRating, b.brewer, b.beerName, b.beerType, b.beerFlavors from beerreview as br, beer as b where br.beerID = b.beerID and br.userID=:userID").setResultTransformer(Transformers.aliasToBean(ReviewList.class));
        query.setString("userID", FBLogin.FB_LOGIN_ID);
        List<ReviewList> beerReviewList = query.list();
        model.addAttribute("bList", beerReviewList);

        return "seemybeers";
    }

    @RequestMapping("/findabeer")
    public String findABeer() {


        return "findabeer";
    }


//    @RequestMapping("/redirect")
//    public String Redirect(@RequestParam("status") String id,
//                           @RequestParam("name") String name,
//                           @RequestParam("page") String page) {
//        FBLogin.FB_LOGIN_NAME=name;
//        FBLogin.FB_LOGIN_ID=id;
//
//        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
//        SessionFactory sessionFact = cfg.buildSessionFactory();
//        Session session = sessionFact.openSession();
//        //session.beginTransaction();
//        Transaction tx = session.beginTransaction();
//
//        UsersEntity newUser = new UsersEntity();
//
//        newUser.setUserId(FBLogin.FB_LOGIN_ID);
//        newUser.setUserName(FBLogin.FB_LOGIN_NAME);
//
//        try {
//            session.save(newUser);
//            tx.commit();
//            session.close();
//        } catch (Exception e){
//            session.close();
//
//        }

//
//        return page;
//    }

    @RequestMapping("searchbyname")
    public String searchByName(@RequestParam("beerName") String beerName, Model model) {
        Criteria c = createSession();
        c.add(Restrictions.like("beerName", "%" + beerName + "%"));
        ArrayList<BeerEntity> beerList = (ArrayList<BeerEntity>) c.list();
        model.addAttribute("bList", beerList);

        return "findabeerresult";
    }

    @RequestMapping("searchbybrewer")
    public String searchByBrewer(@RequestParam("brewer") String brewer, Model model) {
        Criteria c = createSession();
        c.add(Restrictions.like("brewer", "%" + brewer + "%"));
        ArrayList<BeerEntity> beerList = (ArrayList<BeerEntity>) c.list();
        model.addAttribute("bList", beerList);

        return "findabeerresult";
    }

    @RequestMapping("searchbybeertype")
    public String searchByBeerType(@RequestParam("beerType") String beerType, Model model) {
        Criteria c = createSession();
        c.add(Restrictions.like("beerType", "%" + beerType + "%"));
        ArrayList<BeerEntity> beerList = (ArrayList<BeerEntity>) c.list();
        model.addAttribute("bList", beerList);

        return "findabeerresult";
    }

    private static Criteria createSession() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        session.beginTransaction();
        return session.createCriteria(BeerEntity.class);
    }

    @RequestMapping("addabeer")
    public String addABeer() {
//        FBLogin.FB_LOGIN_NAME=name;
//        FBLogin.FB_LOGIN_ID=id;
//
//        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
//        SessionFactory sessionFact = cfg.buildSessionFactory();
//        Session session = sessionFact.openSession();
//       // session.beginTransaction();
//        Transaction tx = session.beginTransaction();
//
//        UsersEntity newUser = new UsersEntity();
//
//        newUser.setUserId(FBLogin.FB_LOGIN_ID);
//        newUser.setUserName(FBLogin.FB_LOGIN_NAME);
//
//        try {
//            session.save(newUser);
//            tx.commit();
//            session.close();
//        } catch (Exception e){
//            session.close();
//
//        }

        return "addabeer";
    }

    @RequestMapping("addabeersuccess")
    public ModelAndView addABeer(@RequestParam("brewer") String brewer,
                                 @RequestParam("beerName") String beerName,
                                 @RequestParam("beerType") String beerType,
                                 @RequestParam("beerFlavors") String beerFlavors) {

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
}

