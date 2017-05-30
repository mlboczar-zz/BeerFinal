package com.grandcircus.spring.controller;

import com.grandcircus.spring.models.ReviewList;
import com.grandcircus.spring.models.UsersEntity;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by seandunn92 on 5/30/17.
 */

@Controller
public class FirstTimeUser {

    @RequestMapping("/findabeer1")
    public String findABeer1(@RequestParam("status") String id,
                             @RequestParam("name") String name)
    {
        FBLogin.FB_LOGIN_NAME=name;
        FBLogin.FB_LOGIN_ID=id;

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        //session.beginTransaction();
        Transaction tx = session.beginTransaction();

        UsersEntity newUser = new UsersEntity();

        newUser.setUserId(FBLogin.FB_LOGIN_ID);
        newUser.setUserName(FBLogin.FB_LOGIN_NAME);

        try {
            session.save(newUser);
            tx.commit();
            session.close();
        } catch (Exception e){
            session.close();

        }


        return "findabeer";
    }

    @RequestMapping("/addabeer1")
    public String addABeer1(@RequestParam("status") String id,
                            @RequestParam("name") String name)
    {
        FBLogin.FB_LOGIN_NAME=name;
        FBLogin.FB_LOGIN_ID=id;

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        //session.beginTransaction();
        Transaction tx = session.beginTransaction();

        UsersEntity newUser = new UsersEntity();

        newUser.setUserId(FBLogin.FB_LOGIN_ID);
        newUser.setUserName(FBLogin.FB_LOGIN_NAME);

        try {
            session.save(newUser);
            tx.commit();
            session.close();
        } catch (Exception e){
            session.close();

        }


        return "addabeer";
    }

    @RequestMapping("/seemybeers1")
    public String seeMyBeer1(@RequestParam("status") String id,
                             @RequestParam("name") String name, Model model)
    {
        FBLogin.FB_LOGIN_NAME=name;
        FBLogin.FB_LOGIN_ID=id;

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        //session.beginTransaction();
        Transaction tx = session.beginTransaction();

        UsersEntity newUser = new UsersEntity();

        newUser.setUserId(FBLogin.FB_LOGIN_ID);
        newUser.setUserName(FBLogin.FB_LOGIN_NAME);

        try {
            session.save(newUser);
            tx.commit();

        } catch (Exception e){


        }

        Query query = session.createSQLQuery("select br.beerDescription, br.beerRating, b.brewer, b.beerName, b.beerType, b.beerFlavors from beerreview as br, beer as b where br.beerID = b.beerID and br.userID=:userID").setResultTransformer(Transformers.aliasToBean(ReviewList.class));
        query.setString("userID", FBLogin.FB_LOGIN_ID);
        List<ReviewList> beerReviewList = query.list();
        model.addAttribute("bList", beerReviewList);

        session.close();
        return "seemybeers";
    }



}
