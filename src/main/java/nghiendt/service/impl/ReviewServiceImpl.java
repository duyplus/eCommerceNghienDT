package nghiendt.service.impl;

import nghiendt.entity.Review;
import nghiendt.repository.ReviewRepository;
import nghiendt.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    ReviewRepository reviewRepository;

    @Override
    public List<Review> findAll() {
        return reviewRepository.findAll();
    }

    @Override
    public Review findById(int reviewid) {
        return reviewRepository.findById(reviewid).get();
    }


    @Override
    public Review create(Review product) {
        return reviewRepository.save(product);
    }

    @Override
    public Review update(Review product) {
        return reviewRepository.save(product);
    }

    @Override
    public void delete(int reviewid) {
        reviewRepository.deleteById(reviewid);
    }
}
