package com.grandcircus.spring.controller;

import com.grandcircus.spring.models.BeerEntity;
import com.grandcircus.spring.models.ReviewList;
import com.grandcircus.spring.models.UsersEntity;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by seandunn92 on 5/30/17.
 */

@Controller
public class FirstTimeUser {

    @RequestMapping("/findabeer1")
    public String findABeer1(@RequestParam("status") String id,
                             @RequestParam("name") String name) {

        FBLogin.FB_LOGIN_NAME = name;
        FBLogin.FB_LOGIN_ID = id;
        Session session = getSession();
        probeDatabase(session);
        session.close();

        return "findabeer";
    }

    @RequestMapping("/reviewabeer1")
    public String reviewABeer1(@RequestParam("status") String id,
                               @RequestParam("name") String name, Model model) {

        FBLogin.FB_LOGIN_NAME = name;
        FBLogin.FB_LOGIN_ID = id;
        Session session = getSession();
        probeDatabase(session);
        Criteria c = HomeController.createSession();
        ArrayList<BeerEntity> beersList = (ArrayList<BeerEntity>) c.list();
        model.addAttribute("beersList", beersList);
        session.close();

        return "reviewabeer";
    }

    @RequestMapping("/addabeer1")
    public String addABeer1(@RequestParam("status") String id,
                            @RequestParam("name") String name) {

        FBLogin.FB_LOGIN_NAME = name;
        FBLogin.FB_LOGIN_ID = id;
        Session session = getSession();
        probeDatabase(session);
        session.close();

        return "addabeer";
    }

    @RequestMapping("/seemybeers1")
    public String seeMyBeer1(@RequestParam("status") String id,
                             @RequestParam("name") String name, Model model) {

        FBLogin.FB_LOGIN_NAME = name;
        FBLogin.FB_LOGIN_ID = id;
        Session session = getSession();
        probeDatabase(session);

        Query query = session.createSQLQuery("select br.beerDescription, br.beerRating, b.brewer, b.beerName, b.beerType, b.beerFlavors from beerreview as br, beer as b where br.beerID = b.beerID and br.userID=:userID").setResultTransformer(Transformers.aliasToBean(ReviewList.class));
        query.setString("userID", FBLogin.FB_LOGIN_ID);
        List<ReviewList> beerReviewList = query.list();
        model.addAttribute("bList", beerReviewList);
        session.close();

        return "seemybeers";
    }

    private void probeDatabase(Session session) {

        Transaction tx = session.beginTransaction();
        UsersEntity newUser = new UsersEntity();
        newUser.setUserId(FBLogin.FB_LOGIN_ID);
        newUser.setUserName(FBLogin.FB_LOGIN_NAME);

        try {
            session.save(newUser);
            tx.commit();
        } catch (Exception e) {
            System.out.println("User was already in database");
        }
    }

    private Session getSession() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        return sessionFact.openSession();
    }
}
