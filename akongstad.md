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

```

### Run duckdb and init ssb
```bash
duckdb -init benchmark/ssb/queries/load.sql
```

### Create answer files
```sql
COPY (
    --- Query
) TO 'benchmark/ssb/answers/q04_1.csv' (HEADER);
```
