# Docker, Python, and PostgreSQL

## Introduction

In this section, Python and PostgreSQL were used to build a simple data pipeline which would be run in Docker containers. The flow of pipeline was to retrieve the file from the website, validate data, and import the data into the database in batches. File `ingest_data.py` was the script used to run the workflow.

Optional: To run this pipeline on Google Cloud Platform, first create a Compute Engine service then use SSH keys to connect from local machine to the cloud service.

Tech stack: Python, PostgreSQL, Docker, GCP.

## Getting started

### Prerequisites

Docker and Python installed on your machine.

### Installation

**Clone the folder**

```
mkdir de_pipeline && cd de_pipeline

git init

git remote add -f origin https://github.com/username/repository-name.git

git config core.sparseCheckout true

echo "folder-name/*" >> .git/info/sparse-checkout

git pull origin main

```

## How to run the code

1. Build the pipeline:

```
docker build -t taxi_ingest:v001 .
```

2. Setup and run PostgreSQL and PGAdmin using Docker Compose:

```
docker compose up
```

3. Run the pipeline with Docker:

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

## Results

Built and ran successfully the data pipeline in local machine with Docker and use Compute Engine in Google Cloud Platform to run the same pipeline.

## Comparisions: version 1 vs. version 2

Version 2 had [uv package](https://docs.astral.sh/uv/) create virtual environment, install and manage all necessary Python packages for this data pipeline. 

`ingest_data.py`

Python package used in each version

| Version name | CLI | Time measure  |
| :--------: | :-------- | -------- |
| version1 | [argv](https://docs.python.org/3/library/argparse.html) | [time](https://docs.python.org/3/library/time.html) |
| version2 | [click](https://click.palletsprojects.com/en/stable/) | [tqdm](https://tqdm.github.io/) |



