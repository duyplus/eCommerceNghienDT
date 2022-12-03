package nghiendt.controller;

import nghiendt.entity.Banner;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.BannerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping(value = "/api/banner")
public class BannerRestController {
    @Autowired
    private BannerRepository bannerRepository;

    @GetMapping
    public ResponseEntity<List<Banner>> getAllBanners() {
        List<Banner> listBanner = bannerRepository.findAll();
        if (listBanner.isEmpty()) {
            return new ResponseEntity<List<Banner>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Banner>>(listBanner, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Banner> getBannersById(@PathVariable int id) {
        Banner banner = bannerRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Banner not exist with id: " + id));
        return ResponseEntity.ok(banner);
    }

    @PostMapping
    public Banner createBanners(@RequestBody Banner banner) {
        return bannerRepository.save(banner);
    }

    @PutMapping("{id}")
    public ResponseEntity<Banner> updateBanners(@PathVariable("id") int id, @RequestBody Banner banner) {
        Banner updateBanner = bannerRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Banner not exist with id: " + id));
        bannerRepository.save(banner);
        return ResponseEntity.ok(updateBanner);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> deleteBanners(@PathVariable int id) {
        Banner banner = bannerRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Banner not exist with id: " + id));
        bannerRepository.delete(banner);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
