package com.grandcircus.spring.controller;

import com.grandcircus.spring.models.BeerEntity;
import com.grandcircus.spring.models.BeerreviewEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

//import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

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
    public String findABeer()
    {
        return "findabeer";
    }

    @RequestMapping("searchbyname")
    public String searchByName(@RequestParam("beerName") String beerName, Model model){

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        session.beginTransaction();
        Criteria c = session.createCriteria(BeerEntity.class);

        c.add(Restrictions.like("beerName","%" + beerName + "%"));
        ArrayList<BeerEntity> beerList = (ArrayList<BeerEntity>) c.list();
        model.addAttribute("bList", beerList);

        return "findabeerresult";
    }

    @RequestMapping("searchbybrewer")
    public String searchByBrewer(@RequestParam("brewer") String brewer, Model model){

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        session.beginTransaction();
        Criteria c = session.createCriteria(BeerEntity.class);

        c.add(Restrictions.like("brewer","%" + brewer + "%"));
        ArrayList<BeerEntity> beerList = (ArrayList<BeerEntity>) c.list();
        model.addAttribute("bList", beerList);

        return "findabeerresult";
    }

    @RequestMapping("searchbybeertype")
    public String searchByBeerType(@RequestParam("beerType") String beerType, Model model){

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        session.beginTransaction();
        Criteria c = session.createCriteria(BeerEntity.class);

        c.add(Restrictions.like("beerType","%" + beerType + "%"));
        ArrayList<BeerEntity> beerList = (ArrayList<BeerEntity>) c.list();
        model.addAttribute("bList", beerList);

        return "findabeerresult";
    }
}
