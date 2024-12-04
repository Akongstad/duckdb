CREATE TABLE experiment (
    experiment_id INTEGER,
    sf TEXT,
    query TEXT,
    num_threads INTEGER,
    num_repetition INTEGER,
    total_time FLOAT,
);

Create table operator (
    experiment_id INTEGER,
    operator_type TEXT,
    operator_timing float,
);

copy experiment from 'benchmark/ssb/results/thread_results.csv';
copy operator from 'benchmark/ssb/results/thread_operators.csv';

copy experiment from 'benchmark/ssb/results/sf_results.csv';
copy operator from 'benchmark/ssb/results/sf_operators.csv';
