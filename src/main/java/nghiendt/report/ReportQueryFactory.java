package nghiendt.report;

import lombok.RequiredArgsConstructor;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.Arrays;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class ReportQueryFactory {
    private final EntityManager entityManager;

    private static class ReportQuery {
        static final String REVENUE_SHOP_BY_YEAR =
                createNativeStoredProcedureQuery("revenueShopByYear", "shopId", "year");
        static final String REVENUE_ALL_SHOP_BY_YEAR =
                createNativeStoredProcedureQuery("revenueAllShopsByYear", "year");
        static final String PRODUCT_SALES_BY_SHOP =
                createNativeStoredProcedureQuery("productSalesByShop", "shopId");
        static final String PRODUCT_SALES_BY_YEAR =
                createNativeStoredProcedureQuery("productSalesByYear", "year");

        private static String createNativeStoredProcedureQuery(String procName, String... paramNames) {
            return String.format("{CALL %s(%s)}",
                    procName,
                    Arrays.stream(paramNames).map(name -> ":" + name)
                            .collect(Collectors.joining(", ")));
        }
    }

    private class MyQuery {
        private final Query query;

        private MyQuery(String query) {
            this.query = entityManager.createNativeQuery(query);
        }

        //convert Object[] to Map
        private MyQuery convertToMap() {
            query.unwrap(org.hibernate.query.Query.class)
                    .setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
            return this;
        }

        private MyQuery setParameter(String name, Object value) {
            query.setParameter(name, value);
            return this;
        }

        private Query getQuery() {
            return query;
        }

    }


    public Query revenueShopByYear(Long shopId, int year) {
        return new MyQuery(ReportQuery.REVENUE_SHOP_BY_YEAR)
                .setParameter("shopId", shopId)
                .setParameter("year", year)
                .convertToMap()
                .getQuery();
    }

    public Query revenueAllShopsByYear(int year) {
        return new MyQuery(ReportQuery.REVENUE_ALL_SHOP_BY_YEAR)
                .setParameter("year", year)
                .convertToMap()
                .getQuery();
    }

    public Query productSalesByShop(Long shopId) {
        return new MyQuery(ReportQuery.PRODUCT_SALES_BY_SHOP)
                .setParameter("shopId", shopId)
                .convertToMap()
                .getQuery();
    }

    public Query productSalesByYear(int year) {
        return new MyQuery(ReportQuery.PRODUCT_SALES_BY_YEAR)
                .setParameter("year", year)
                .convertToMap()
                .getQuery();
    }

}