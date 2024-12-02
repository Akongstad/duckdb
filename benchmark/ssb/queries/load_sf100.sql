SET
    memory_limit = '100GB';

SET
    threads TO 4;

-- Create schema
CREATE TABLE part (
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

CREATE TABLE supplier (
    s_suppkey UINTEGER PRIMARY KEY,
    s_name TEXT,
    s_address TEXT,
    s_city TEXT,
    --S_NATION_PREFIX UTINYINT,
    s_nation TEXT,
    s_region TEXT,
    s_phone TEXT,
);

CREATE TABLE customer (
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

CREATE TABLE date(
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

CREATE TABLE lineorder (
    lo_orderkey UINTEGER,
    lo_linenumber UTINYINT,
    lo_custkey UINTEGER, -- FK to C_CUSTKEY
    lo_partkey UINTEGER, -- FK to P_PARTKEY
    lo_suppkey UINTEGER, -- FK to S_SUPPKEY
    lo_orderdate DATE, -- FK to D_DATEKEY
    lo_orderpriority TEXT,
    lo_shippriority TEXT,
    lo_quantity UTINYINT,
    lo_extendedprice UINTEGER,
    lo_ordtotalprice UINTEGER,
    lo_discount UTINYINT,
    lo_revenue UINTEGER,
    lo_supplycost UINTEGER,
    lo_tax UTINYINT,
    lo_commitdate DATE, -- FK to D_DATEKEY
    lo_shipmod TEXT,
    -- FOREIGN KEY (lo_custkey) REFERENCES customer (c_custkey),
    -- FOREIGN KEY (lo_partkey) REFERENCES part (p_partkey),
    -- FOREIGN KEY (lo_suppkey) REFERENCES supplier (s_suppkey),
    -- FOREIGN KEY (lo_orderdate) REFERENCES DATE(d_datekey),
    -- FOREIGN KEY (lo_commitdate) REFERENCES DATE(d_datekey),
    -- PRIMARY KEY (lo_orderkey, lo_linenumber)
);

COPY customer
FROM
    'benchmark/ssb/data/sf100/customer.csv.gz';

COPY date
FROM
    'benchmark/ssb/data/sf100/date.csv.gz';

COPY part
FROM
    'benchmark/ssb/data/sf100/part.csv.gz';

COPY supplier
FROM
    'benchmark/ssb/data/sf100/supplier.csv.gz';

COPY lineorder
FROM
    'benchmark/ssb/data/sf100/lineorder.csv.gz';

--.timer on
--create or replace table lineorder as select * from read_csv('benchmark/ssb/data/sf100/supplier.tbl.gz');
-- COPY lineorder FROM 'benchmark/ssb/data/sf100/lineorder.csv.gz';
-- INSERT INTO lineorder
-- SELECT *
-- FROM read_csv('benchmark/ssb/data/sf100/lineorder.csv.gz',
--     delim=',',
--     header=FALSE,
--     columns={
--         'lo_orderkey': UINTEGER,
--         'lo_linenumber': UTINYINT,
--         'lo_custkey': UINTEGER,       -- FK to C_CUSTKEY
--         'lo_partkey': UINTEGER,       -- FK to P_PARTKEY
--         'lo_suppkey': UINTEGER,       -- FK to S_SUPPKEY
--         'lo_orderdate': DATE,         -- FK to D_DATEKEY
--         'lo_orderpriority': TEXT,
--         'lo_shippriority': TEXT,
--         'lo_quantity': UTINYINT,
--         'lo_extendedprice': UINTEGER,
--         'lo_ordtotalprice': UINTEGER,
--         'lo_discount': UTINYINT,
--         'lo_revenue': UINTEGER,
--         'lo_supplycost': UINTEGER,
--         'lo_tax': UTINYINT,
--         'lo_commitdate': DATE,        -- FK to D_DATEKEY
--         'lo_shipmod': TEXT
--     }
-- );
