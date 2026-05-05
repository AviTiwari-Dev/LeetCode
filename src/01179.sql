-- Write your PostgreSQL query statement below
SELECT
    id,
    SUM(CASE WHEN month = 'Jan' THEN revenue ELSE NULL END) as jan_revenue,
    SUM(CASE WHEN month = 'Feb' THEN revenue ELSE NULL END) as feb_revenue,
    SUM(CASE WHEN month = 'Mar' THEN revenue ELSE NULL END) as mar_revenue,
    SUM(CASE WHEN month = 'Apr' THEN revenue ELSE NULL END) as apr_revenue,
    SUM(CASE WHEN month = 'May' THEN revenue ELSE NULL END) as may_revenue,
    SUM(CASE WHEN month = 'Jun' THEN revenue ELSE NULL END) as jun_revenue,
    SUM(CASE WHEN month = 'Jul' THEN revenue ELSE NULL END) as jul_revenue,
    SUM(CASE WHEN month = 'Aug' THEN revenue ELSE NULL END) as aug_revenue,
    SUM(CASE WHEN month = 'Sep' THEN revenue ELSE NULL END) as sep_revenue,
    SUM(CASE WHEN month = 'Oct' THEN revenue ELSE NULL END) as oct_revenue,
    SUM(CASE WHEN month = 'Nov' THEN revenue ELSE NULL END) as nov_revenue,
    SUM(CASE WHEN month = 'Dec' THEN revenue ELSE NULL END) as dec_revenue
FROM department
GROUP BY id;
