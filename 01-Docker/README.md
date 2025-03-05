# Docker and PostgreSQL

Using Docker and PostgreSQL to build a simple data pipeline to ingest data.

Build the pipeline:

```
docker build -t taxi_ingest:v001 .
```

Run the pipeline with Docker:

```
docker run -it \
  taxi_ingest:v001 \
    --user=root \
    --password=root \
    --host=pg-database1 \
    --port=5432 \
    --db=ny_taxi \
    --table_name=yellow_taxi_trips \
    --url=https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-10.parquet
```
