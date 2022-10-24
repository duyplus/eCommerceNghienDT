package nghiendt.service;

import nghiendt.entity.Review;

import java.util.List;

public interface ReviewService {

    List<Review> findAll();

    Review findById(int reviewid);

    Review create(Review review);

    Review update(Review review);

    void delete(int reviewid);
}
