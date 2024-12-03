

# Generate the answers for the SSB queries

# SF10
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q01_1_sf10.csv" -c ".read benchmark/ssb/queries/q01_1.sql"
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q01_2_sf10.csv" -c ".read benchmark/ssb/queries/q01_2.sql"
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q01_3_sf10.csv" -c ".read benchmark/ssb/queries/q01_3.sql"
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q02_1_sf10.csv" -c ".read benchmark/ssb/queries/q02_1.sql"
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q02_2_sf10.csv" -c ".read benchmark/ssb/queries/q02_2.sql"
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q02_3_sf10.csv" -c ".read benchmark/ssb/queries/q02_3.sql"
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q03_1_sf10.csv" -c ".read benchmark/ssb/queries/q03_1.sql"
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q03_2_sf10.csv" -c ".read benchmark/ssb/queries/q03_2.sql"
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q03_3_sf10.csv" -c ".read benchmark/ssb/queries/q03_3.sql"
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q03_4_sf10.csv" -c ".read benchmark/ssb/queries/q03_4.sql"
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q04_1_sf10.csv" -c ".read benchmark/ssb/queries/q04_1.sql"
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q04_2_sf10.csv" -c ".read benchmark/ssb/queries/q04_2.sql"
duckdb benchmark/ssb/data/sf10/ssb_sf10.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q04_3_sf10.csv" -c ".read benchmark/ssb/queries/q04_3.sql"

#SF100
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q01_1_sf100.csv" -c ".read benchmark/ssb/queries/q01_1.sql"
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q01_2_sf100.csv" -c ".read benchmark/ssb/queries/q01_2.sql"
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q01_3_sf100.csv" -c ".read benchmark/ssb/queries/q01_3.sql"
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q02_1_sf100.csv" -c ".read benchmark/ssb/queries/q02_1.sql"
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q02_2_sf100.csv" -c ".read benchmark/ssb/queries/q02_2.sql"
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q02_3_sf100.csv" -c ".read benchmark/ssb/queries/q02_3.sql"
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q03_1_sf100.csv" -c ".read benchmark/ssb/queries/q03_1.sql"
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q03_2_sf100.csv" -c ".read benchmark/ssb/queries/q03_2.sql"
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q03_3_sf100.csv" -c ".read benchmark/ssb/queries/q03_3.sql"
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q03_4_sf100.csv" -c ".read benchmark/ssb/queries/q03_4.sql"
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q04_1_sf100.csv" -c ".read benchmark/ssb/queries/q04_1.sql"
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q04_2_sf100.csv" -c ".read benchmark/ssb/queries/q04_2.sql"
duckdb benchmark/ssb/data/sf100/ssb_sf100.duckdb -c ".mode csv" -c ".separator |" -c ".output benchmark/ssb/answers/q04_3_sf100.csv" -c ".read benchmark/ssb/queries/q04_3.sql"
