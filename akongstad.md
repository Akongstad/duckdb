# Useful things for Project 2 ADS

A compilation of commands used to complete Project 2.

## Running the experiments

```bash
BUILD_BENCHMARK=1 CORE_EXTENSIONS='tpch' make

#Thread exp
build/release/benchmark/benchmark_runner benchmark/ssb/sf10/q01_1.benchmark --out=benchmark/ssb/results/sf10/q01_1_results.csv --log=benchmark/ssb/results/q01_1_results_logs.json --profile --threads=1
build/release/benchmark/benchmark_runner benchmark/ssb/sf10/q01_1.benchmark --out=benchmark/ssb/results/sf10/q01_1_results.csv --log=benchmark/ssb/results/q01_1_results_logs.json --profile --threads=4
build/release/benchmark/benchmark_runner benchmark/ssb/sf10/q01_1.benchmark --out=benchmark/ssb/results/sf10/q01_1_results.csv --log=benchmark/ssb/results/q01_1_results_logs.json --profile --threads=8

build/release/benchmark/benchmark_runner benchmark/ssb/sf10/q03_1.benchmark --out=benchmark/ssb/results/sf10/q03_1_results.csv --log=benchmark/ssb/results/q03_1_results_logs.json --profile --threads=1
build/release/benchmark/benchmark_runner benchmark/ssb/sf10/q03_1.benchmark --out=benchmark/ssb/results/sf10/q03_1_results.csv --log=benchmark/ssb/results/q03_1_results_logs.json --profile --threads=4
build/release/benchmark/benchmark_runner benchmark/ssb/sf10/q03_1.benchmark --out=benchmark/ssb/results/sf10/q03_1_results.csv --log=benchmark/ssb/results/q03_1_results_logs.json --profile --threads=8

build/release/benchmark/benchmark_runner benchmark/ssb/sf10/q04_1.benchmark --out=benchmark/ssb/results/sf10/q04_1_results.csv --log=benchmark/ssb/results/q04_1_results_logs.json --profile --threads=1
build/release/benchmark/benchmark_runner benchmark/ssb/sf10/q04_1.benchmark --out=benchmark/ssb/results/sf10/q04_1_results.csv --log=benchmark/ssb/results/q04_1_results_logs.json --profile --threads=4
build/release/benchmark/benchmark_runner benchmark/ssb/sf10/q04_1.benchmark --out=benchmark/ssb/results/sf10/q04_1_results.csv --log=benchmark/ssb/results/q04_1_results_logs.json --profile --threads=8

#sf1
build/release/benchmark/benchmark_runner benchmark/ssb/sf1/q01_1.benchmark --out=benchmark/ssb/results/q01_1_results.csv --log=benchmark/ssb/results/q01_1_results_logs.json --profile --threads=4
build/release/benchmark/benchmark_runner benchmark/ssb/sf1/q03_1.benchmark --out=benchmark/ssb/results/q03_1_results.csv --log=benchmark/ssb/results/q03_1_results_logs.json --profile --threads=4
build/release/benchmark/benchmark_runner benchmark/ssb/sf1/q04_1.benchmark --out=benchmark/ssb/results/q04_1_results.csv --log=benchmark/ssb/results/q04_1_results_logs.json --profile --threads=4

#sf10
build/release/benchmark/benchmark_runner benchmark/ssb/sf10/q01_1.benchmark --out=benchmark/ssb/results/q01_1_results.csv --log=benchmark/ssb/results/q01_1_results_logs.json --profile --threads=4
build/release/benchmark/benchmark_runner benchmark/ssb/sf10/q03_1.benchmark --out=benchmark/ssb/results/q03_1_results.csv --log=benchmark/ssb/results/q03_1_results_logs.json --profile --threads=4
build/release/benchmark/benchmark_runner benchmark/ssb/sf10/q04_3.benchmark --out=benchmark/ssb/results/q04_1_results.csv --log=benchmark/ssb/results/q04_1_results_logs.json --profile --threads=4

#sf100
build/release/benchmark/benchmark_runner benchmark/ssb/sf100/q01_1.benchmark --out=benchmark/ssb/results/q01_1_results.csv --log=benchmark/ssb/results/q01_1_results_logs.json --profile --threads=4
build/release/benchmark/benchmark_runner benchmark/ssb/sf100/q03_1.benchmark --out=benchmark/ssb/results/q03_1_results.csv --log=benchmark/ssb/results/q03_1_results_logs.json --profile --threads=4
build/release/benchmark/benchmark_runner benchmark/ssb/sf100/q04_1.benchmark --out=benchmark/ssb/results/q04_1_results.csv --log=benchmark/ssb/results/q04_1_results_logs.json --profile --threads=4
```

#### Run all benchmarks
```bash
#sf1
build/release/benchmark/benchmark_runner "benchmark/ssb/sf1/.*"

#sf10
build/release/benchmark/benchmark_runner "benchmark/ssb/sf10/.*"

#sf100
build/release/benchmark/benchmark_runner "benchmark/ssb/sf100/.*"

# All
build/release/benchmark/benchmark_runner "benchmark/ssb/.*"
```
---

### Generating answer.csv

```bash
duckdb test.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q01_1_sf10" -c ".read benchmark/ssb/queries/q01_1.sql"
```

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

### run duckdb and initialize with loads script

```
duckdb benchmark/ssb/data/sf1/ssb_sf1.duckdb -init benchmark/ssb/queries/load.sql
```
