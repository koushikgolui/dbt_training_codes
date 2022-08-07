
{{config(materialized='table')}}
select * From SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER
