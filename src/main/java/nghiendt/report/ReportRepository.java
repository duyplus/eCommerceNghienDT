package nghiendt.report;

import java.util.List;
import java.util.Map;

public interface ReportRepository {
    Map revenueShopByYear(Long shopId, Integer year);

    List revenueAllShopsByYear(Integer year);

    List productSalesByShop(Long shopId);

    List productSalesByYear(Integer year);
}
