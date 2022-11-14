package nghiendt.report;

import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import nghiendt.exception.ResourceNotFoundException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class ReportRepositoryImp implements ReportRepository {
    private final ReportQueryFactory reportFactory;

    @Override
    @SneakyThrows
    public Map revenueShopByYear(Long id, Integer year) {
        return (Map) reportFactory.revenueShopByYear(id, year)
                                  .getResultStream()
                                  .findFirst()
                                  .orElseThrow(() -> new ResourceNotFoundException(
                                          String.format("No report was found for shop_id: %s in year: %s", id, year)));
    }

    @Override
    public List revenueAllShopsByYear(Integer year) {
        return reportFactory.revenueAllShopsByYear(year).getResultList();
    }

    @Override
    public List productSalesByShop(Long shopId) {
        return reportFactory.productSalesByShop(shopId).getResultList();
    }

    @Override
    public List productSalesByYear(Integer year) {
        return reportFactory.productSalesByYear(year).getResultList();
    }
}
