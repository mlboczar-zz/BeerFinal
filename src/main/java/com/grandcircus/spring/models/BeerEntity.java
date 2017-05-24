package com.grandcircus.spring.models;

import javax.persistence.*;

/**
 * Created by Megan on 5/22/2017.
 */
@Entity
@Table(name = "beer", schema = "beer", catalog = "")
public class BeerEntity {
    private String beerName;
    private String location;
    private int beerId;
    private String beerType;
    private String beerFlavors;
    private Integer userId;
    private String brewer;

    @Basic
    @Column(name = "beerName", nullable = true, length = 45)
    public String getBeerName() {
        return beerName;
    }

    public void setBeerName(String beerName) {
        this.beerName = beerName;
    }

    @Basic
    @Column(name = "location", nullable = true, length = 45)
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Id
    @Column(name = "beerID", nullable = false)
    public int getBeerId() {
        return beerId;
    }

    public void setBeerId(int beerId) {
        this.beerId = beerId;
    }

    @Basic
    @Column(name = "beerType", nullable = true, length = 45)
    public String getBeerType() {
        return beerType;
    }

    public void setBeerType(String beerType) {
        this.beerType = beerType;
    }

    @Basic
    @Column(name = "beerFlavors", nullable = true, length = 45)
    public String getBeerFlavors() {
        return beerFlavors;
    }

    public void setBeerFlavors(String beerFlavors) {
        this.beerFlavors = beerFlavors;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BeerEntity that = (BeerEntity) o;

        if (beerId != that.beerId) return false;
        if (beerName != null ? !beerName.equals(that.beerName) : that.beerName != null) return false;
        if (location != null ? !location.equals(that.location) : that.location != null) return false;
        if (beerType != null ? !beerType.equals(that.beerType) : that.beerType != null) return false;
        if (beerFlavors != null ? !beerFlavors.equals(that.beerFlavors) : that.beerFlavors != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = beerName != null ? beerName.hashCode() : 0;
        result = 31 * result + (location != null ? location.hashCode() : 0);
        result = 31 * result + beerId;
        result = 31 * result + (beerType != null ? beerType.hashCode() : 0);
        result = 31 * result + (beerFlavors != null ? beerFlavors.hashCode() : 0);
        return result;
    }

    @Basic
    @Column(name = "userID", nullable = true)
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "brewer", nullable = true, length = 45)
    public String getBrewer() {
        return brewer;
    }

    public void setBrewer(String brewer) {
        this.brewer = brewer;
    }
}
