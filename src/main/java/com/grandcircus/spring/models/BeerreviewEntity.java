package com.grandcircus.spring.models;

import javax.persistence.*;

/**
 * Created by Megan on 5/23/2017.
 */
@Entity
@Table(name = "beerreview", schema = "beer", catalog = "")
public class BeerreviewEntity {
    private int beerId;
    private String beerDescription;
    private String beerRating;
    private int reviewId;
    private String userId;

    @Id
    @Column(name = "userID", nullable = false, length = 100)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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
    @Column(name = "beerDescription", nullable = true, length = 45)
    public String getBeerDescription() {
        return beerDescription;
    }

    public void setBeerDescription(String beerDescription) {
        this.beerDescription = beerDescription;
    }

    @Basic
    @Column(name = "beerRating", nullable = true, length = 45)
    public String getBeerRating() {
        return beerRating;
    }

    public void setBeerRating(String beerRating) {
        this.beerRating = beerRating;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BeerreviewEntity that = (BeerreviewEntity) o;

        if (userId != null ? !userId.equals(that.userId) : that.userId != null) return false;
        if (beerId != that.beerId) return false;
        if (beerDescription != null ? !beerDescription.equals(that.beerDescription) : that.beerDescription != null)
            return false;
        if (beerRating != null ? !beerRating.equals(that.beerRating) : that.beerRating != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = beerId;
        result = 31 * result + (beerDescription != null ? beerDescription.hashCode() : 0);
        result = 31 * result + (beerRating != null ? beerRating.hashCode() : 0);
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        return result;
    }

    @Id
    @Column(name = "reviewID", nullable = false)
    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }
}
