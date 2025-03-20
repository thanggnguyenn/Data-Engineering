# Docker and PostgreSQL

Using Docker and PostgreSQL to build a simple data pipeline to ingest data. Retrieve the file from the website and import the data into the database in batches.

File `ingest_data.py` is used to run the workflow. First, it will download the file from the website in the Parquet format file. Then using `Pandas, SQLAlchemy` to preproces the data and create a data schema before loading the data into Postgres database.

To run this pipeline on Google Cloud Platform, first create a Compute Engine service then use SSH keys to connect from local machine to the cloud service.

**Results:** Built and ran successfully the data pipeline in local machine with Docker and use Compute Engine in Google Cloud Platform to run the same pipeline.



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

Docker Compose to setup and run PostgreSQL and PGAdmin:

```
docker compose up
```
