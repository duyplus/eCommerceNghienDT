package nghiendt.report;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/report")
@RequiredArgsConstructor
public class ReportController {
    private final ReportRepository reportRepository;

    @GetMapping("/revenue-shop-by-year")
    public ResponseEntity<Map> revenueShopByYear(Optional<Long> shopId, Optional<Integer> year) {
        return ResponseEntity.ok(
                reportRepository.revenueShopByYear(orElseThrowShopId(shopId), orCurrentYear(year)));
    }

    @GetMapping("/revenue-all-shops")
    public ResponseEntity<List> revenueAllShops(Optional<Integer> year) {
        return ResponseEntity.ok(
                reportRepository.revenueAllShopsByYear(orCurrentYear(year)));
    }

    @GetMapping("/product-sales-by-shop")
    public ResponseEntity<List> productSalesByShop(Optional<Long> shopId) {
        return ResponseEntity.ok(
                reportRepository.productSalesByShop(orElseThrowShopId(shopId)));
    }

    @GetMapping("/product-sales-by-year")
    public ResponseEntity<List> productSalesByYear(Optional<Integer> year) {
        return ResponseEntity.ok(
                reportRepository.productSalesByYear(orCurrentYear(year)));
    }

    private int orCurrentYear(Optional<Integer> year) {
        return year.orElse(LocalDateTime.now().getYear());
    }

    private Long orElseThrowShopId(Optional<Long> shopId) {
        return shopId.orElseThrow(() -> new IllegalArgumentException("No shopId was provided"));
    }
}
