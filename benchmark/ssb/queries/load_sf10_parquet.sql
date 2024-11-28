SET threads TO 4;
SET memory_limit = '14GB';
SET max_temp_directory_size = '100GB';

-- IMPORT DATABASE 'benchmark/ssb/data/sf10';

CREATE TABLE customer AS
FROM
    read_parquet ('benchmark/ssb/data/sf10//customer.parquet');

CREATE TABLE date AS
FROM
    read_parquet ('benchmark/ssb/data/sf10//date.parquet');

CREATE TABLE part AS
FROM
    read_parquet ('benchmark/ssb/data/sf10//part.parquet');

CREATE TABLE supplier AS
FROM
    read_parquet('benchmark/ssb/data/sf10//supplier.parquet');

CREATE TABLE lineorder AS
FROM
    read_parquet ('benchmark/ssb/data/sf10//lineorder.parquet');
