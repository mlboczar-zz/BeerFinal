package com.grandcircus.spring.controller;

import com.grandcircus.spring.models.BeerEntity;
import com.grandcircus.spring.models.BeerreviewEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

/**
 * Created by seandunn92 on 5/25/17.
 */

@Controller
public class ListMyBeersController {


    @RequestMapping("/listmybeers")
    public String searchByBrewer(Model model){

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        session.beginTransaction();
        Criteria c = session.createCriteria(BeerreviewEntity.class);

        c.add(Restrictions.like("userId","%" + FBLogin.FB_LOGIN_ID + "%"));
        ArrayList<BeerreviewEntity> beerReviewList = (ArrayList<BeerreviewEntity>) c.list();
        model.addAttribute("bList", beerReviewList);
//        ArrayList<BeerEntity> beerList = (ArrayList<BeerEntity>) c.list();
//        model.addAttribute("beerList", beerList);
//

        return "listmybeers";
    }

}
