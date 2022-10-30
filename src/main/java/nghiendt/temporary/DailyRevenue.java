package nghiendt.temporary;

import java.util.Date;

public interface DailyRevenue {
    int getOrder_quantity();

    Date getToday();

    double getRevenue_order();

    double getSum_revenue();
}
