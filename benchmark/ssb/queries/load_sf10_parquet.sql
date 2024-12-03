SET threads TO 4;
--SET memory_limit = '14GB';
--SET max_temp_directory_size = '100GB';

-- Create schema
CREATE or replace TABLE part (
    p_partkey UINTEGER PRIMARY KEY,
    p_name TEXT,
    p_mfgr TEXT,
    p_category TEXT,
    p_brand1 TEXT,
    p_color TEXT,
    p_type TEXT,
    p_size UTINYINT,
    p_container TEXT,
);

CREATE or replace TABLE supplier (
    s_suppkey UINTEGER PRIMARY KEY,
    s_name TEXT,
    s_address TEXT,
    s_city TEXT,
    --S_NATION_PREFIX UTINYINT,
    s_nation TEXT,
    s_region TEXT,
    s_phone TEXT,
);

CREATE or replace TABLE customer (
    c_custkey UINTEGER PRIMARY KEY,
    c_name TEXT,
    c_address TEXT,
    c_city TEXT,
    --C_NATION_PREFIX UTINYINT,
    c_nation TEXT,
    c_region TEXT,
    c_phone TEXT,
    c_mktsegment TEXT
);

CREATE or replace TABLE date(
    d_datekey DATE PRIMARY KEY,
    d_date TEXT,
    d_dayofweek TEXT,
    d_month TEXT,
    d_year UINTEGER,
    d_yearmonthnum UINTEGER,
    d_yearmonth TEXT,
    d_daynuminweek UINTEGER,
    d_daynuminmonth UINTEGER,
    d_daynuminyear UINTEGER,
    d_monthnuminyear UINTEGER,
    d_weeknuminyear UINTEGER,
    d_sellingseason TEXT,
    d_lastdayinweekfl UTINYINT,
    d_lastdayinmonthfl UTINYINT,
    d_holidayfl UTINYINT,
    d_weekdayfl UTINYINT,
);

COPY customer FROM 'benchmark/ssb/data/sf10//customer.parquet' (FORMAT 'parquet');
COPY date FROM 'benchmark/ssb/data/sf10//date.parquet' (FORMAT 'parquet');
COPY part FROM 'benchmark/ssb/data/sf10//part.parquet' (FORMAT 'parquet');
COPY supplier FROM 'benchmark/ssb/data/sf10//supplier.parquet' (FORMAT 'parquet');
CREATE or replace TABLE lineorder AS
FROM
    read_parquet ('benchmark/ssb/data/sf10//lineorder.parquet');
