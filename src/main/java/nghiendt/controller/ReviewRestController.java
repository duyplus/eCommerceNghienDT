package nghiendt.controller;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import nghiendt.entity.Review;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.ReviewRepository;
import nghiendt.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@SecurityRequirement(name = "nghiendt")
@RequestMapping(value = "/api/review")
public class ReviewRestController {
    @Autowired
    private ReviewService reviewService;

    @Autowired
    private ReviewRepository reviewRepository;

    @GetMapping
    public ResponseEntity<List<Review>> getAllReviews() {
        List<Review> listReview = reviewRepository.findAll();
        if (listReview.isEmpty()) {
            return new ResponseEntity<List<Review>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Review>>(listReview, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Review> getReviewsById(@PathVariable int id) {
        Review review = reviewRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Review not exist with id: " + id));
        return ResponseEntity.ok(review);
    }

    @PostMapping
    public Review createReviews(@RequestBody Review review) {
        return reviewRepository.save(review);
    }

    @PutMapping("{id}")
    public ResponseEntity<Review> updateReviews(@PathVariable("id") int id, @RequestBody Review review) {
        Review updateReview = reviewRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Review not exist with id: " + id));
        reviewRepository.save(review);
        return ResponseEntity.ok(updateReview);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> deleteReviews(@PathVariable int id) {
        Review review = reviewRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Review not exist with id: " + id));
        reviewRepository.delete(review);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
