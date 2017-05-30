package com.grandcircus.spring.models;

/**
 * Created by Megan on 5/30/2017.
 */
public class ReviewList {
    private String beerName;
    private String beerType;
    private String beerFlavors;
    private String brewer;
    private String beerDescription;
    private String beerRating;

    public String getBeerName() {
        return beerName;
    }

    public void setBeerName(String beerName) {
        this.beerName = beerName;
    }

    public String getBeerType() {
        return beerType;
    }

    public void setBeerType(String beerType) {
        this.beerType = beerType;
    }

    public String getBeerFlavors() {
        return beerFlavors;
    }

    public void setBeerFlavors(String beerFlavors) {
        this.beerFlavors = beerFlavors;
    }

    public String getBrewer() {
        return brewer;
    }

    public void setBrewer(String brewer) {
        this.brewer = brewer;
    }

    public String getBeerDescription() {
        return beerDescription;
    }

    public void setBeerDescription(String beerDescription) {
        this.beerDescription = beerDescription;
    }

    public String getBeerRating() {
        return beerRating;
    }

    public void setBeerRating(String beerRating) {
        this.beerRating = beerRating;
    }
}
