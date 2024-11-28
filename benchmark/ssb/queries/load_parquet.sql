CREATE TABLE customer AS
FROM
    read_parquet ('benchmark/ssb/data/sf1//customer.parquet');

CREATE TABLE date AS
FROM
    read_parquet ('benchmark/ssb/data/sf1//date.parquet');

CREATE TABLE part AS
FROM
    read_parquet ('benchmark/ssb/data/sf1//part.parquet');

CREATE TABLE supplier AS
FROM
    read_parquet ('benchmark/ssb/data/sf1//supplier.parquet');

CREATE TABLE lineorder AS
FROM
    read_parquet ('benchmark/ssb/data/sf1//lineorder.parquet');

-- Add the Primary Key
ALTER TABLE lineorder ADD PRIMARY KEY (lo_orderkey, lo_linenumber);
ALTER TABLE date ADD PRIMARY KEY (d_datekey);
ALTER TABLE customer ADD PRIMARY KEY (c_custkey);
ALTER TABLE supplier ADD PRIMARY KEY (s_suppkey);
ALTER TABLE part ADD PRIMARY KEY (p_partkey);

-- Add Foreign Key Constraints
ALTER TABLE lineorder ADD CONSTRAINT fk_custkey FOREIGN KEY (lo_custkey) REFERENCES customer (c_custkey);
ALTER TABLE lineorder ADD CONSTRAINT fk_partkey FOREIGN KEY (lo_partkey) REFERENCES part (p_partkey);
ALTER TABLE lineorder ADD CONSTRAINT fk_suppkey FOREIGN KEY (lo_suppkey) REFERENCES supplier (s_suppkey);
ALTER TABLE lineorder ADD CONSTRAINT fk_orderdate FOREIGN KEY (lo_orderdate) REFERENCES DATE(d_datekey);
ALTER TABLE lineorder ADD CONSTRAINT fk_commitdate FOREIGN KEY (lo_commitdate) REFERENCES DATE(d_datekey);
