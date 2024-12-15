# Project 2 | Advance Datasystems ITU 2024

This folder contains the code for the SSB benchmark.

- **ssb/answers**: answers to ssb queries as csv.
- **ssb/data/**: ssb table data as parquet file in sf1, sf10, and sf100 folders.
- **ssb/queries**: ssb queries as sql.
- **ssb/sf1**: benchmark files and .in files for the sf1 benchmark.
- **ssb/sf10**: benchmark files and .in files for the sf10 benchmark.
- **ssb/sf100**: benchmark files and .in files for the sf100 benchmark.
- **ssb/results**: experiment results.

## Compilation of useful commands for complete Project 2.

### Running the experiments

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

### Running the benchmarking suite

```bash
BUILD_BENCHMARK=1 CORE_EXTENSIONS='tpch' make

build/release/benchmark/benchmark_runner --list

build/release/benchmark/benchmark_runner "benchmark/ssb/.*"
```

### Run duckdb and init ssb

```bash
duckdb -init benchmark/ssb/queries/load.sql
```

### Export to parquet

```sql
EXPORT DATABASE 'benchmark/ssb/data/sf10' (FORMAT PARQUET);
```

### run duckdb persistent and initialize with loads script

```
duckdb benchmark/ssb/data/sf1/ssb_sf1.duckdb -init benchmark/ssb/queries/load.sql
```

### Test profiling performance

```bash

build/release/benchmark/benchmark_runner benchmark/tpch/sf1/q01.benchmark
build/release/benchmark/benchmark_runner benchmark/tpch/sf1/q01.benchmark --profile --out=test.csv
build/release/benchmark/benchmark_runner benchmark/tpch/sf1/q01.benchmark --detailed-profile --out=test.csv
```
