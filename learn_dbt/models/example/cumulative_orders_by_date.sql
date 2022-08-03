
{{ config(materialized='table') }}

WITH total_amount as
     (select o_orderdate, sum(o_totalprice) totalamount
        from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS
       group by o_orderdate
       order by 1 )
 select o_orderdate,
        totalamount,
        sum(totalamount) over(order by o_orderdate rows between unbounded preceding and current row) as cume_amt
   from total_amount
