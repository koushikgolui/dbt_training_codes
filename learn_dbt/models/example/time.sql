{{config(materialized='incremental', unique_key='t_time')}}

select *
 from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.TIME_DIM
where to_time(concat(t_hour::varchar, ':' , t_minute , ':' , t_second)) < current_time

{% if is_incremental() %}
 and t_time > (select max(t_time) from {{ this }})
 {% endif %}
