## Useful things for Project 2 ADS

### DuckDB tpch setup
```sql
./build/release/duckdb

load tpch;

CALL dbgen(sf = 1);

.timer on

pragma tpch(1);

SET profiling_mode = 'detailed';

pragma tpch(1);
```

### Running the benchmarkign suite
```bash
BUILD_BENCHMARK=1 CORE_EXTENSIONS='tpch' make

build/release/benchmark/benchmark_runner --list

build/release/benchmark/benchmark_runner "benchmark/ssb/.*"
```

### Run duckdb and init ssb
```bash
duckdb -init benchmark/ssb/queries/load.sql
```

### Create answer files
```sql
COPY (
    --- Query
) TO 'benchmark/ssb/answers/q04_1.csv' (HEADER, DELIMITER='|');
```

### Export to parquet
```sql
EXPORT DATABASE 'benchmark/ssb/data/sf10' (FORMAT PARQUET);
```

### Creating .duckdb files intead of parquet files
```
duckdb benchmark/ssb/data/sf1/ssb_sf1.duckdb -init benchmark/ssb/queries/load.sql
```
