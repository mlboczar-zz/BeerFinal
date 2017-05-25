package com.grandcircus.spring.controller;

import com.grandcircus.spring.models.UsersEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by seandunn92 on 5/24/17.
 */
@Controller
public class SignUpController {
    @RequestMapping("/redirect")
    public ModelAndView userOptions(@RequestParam("status") String id , @RequestParam("userName") String name)
    {

        if (id.length()<1){
            return new
                    ModelAndView("login","message","You did not log into facebook!");

        }

        //set the FB_LOGIN_ID to the current user, using id passed from login.jsp
        FBLogin.FB_LOGIN_ID = id;
        FBLogin.FB_LOGIN_NAME = name;

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");//copy from up

        SessionFactory sessionFact = cfg.configure().buildSessionFactory();//copy from up
        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();

        UsersEntity newUser = new UsersEntity();

        newUser.setUserId(FBLogin.FB_LOGIN_ID  +"l");
        newUser.setUserName(FBLogin.FB_LOGIN_NAME);



        session.save(newUser);
        tx.commit();
        session.close();


        return new
                ModelAndView("useroptions","loginName",FBLogin.FB_LOGIN_NAME);
    }



}
