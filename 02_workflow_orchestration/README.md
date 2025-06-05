# Workflow Orchestration

## 1. Introduction

In part 2, I will use different orchestrators such as Airflow, Kestra to run workflow, which is ETL process. These workflows will perform the extraction, transformation and loading data from sources to destinations.

## 2. Workflow

In each stage of the ETL process, there were tasks as described below.

Soruces: 

Extraction:

- 

Transformation:

-

- 

Loading:

- 

- 

Destinations: 

## 3. Results and challanges

### a. Results
The amount of data and processing time for each solution

|Tools \ DB | Kestra | Airflow | SQL |
|:----------:|:----------|:----------:|:----------:|
| PostgreSQL - Green  | 1,206,603 rows of data (Jan to Feb of 2019) <br> 7 minutes  | None  | None  |
| PostgreSQL - Yellow  | None  | None  | None |
| Big Query - Green   | None  | None  | None  |
| Big Query - Yellow   |20,332,092 rows of data (Jan to Jun of 2024) / 3.84 GB <br> 3 mins 14.14 secs | None  | 1,000,000 rows of data (one month) / 400 MB <br> 30 secs |

Explain the results:

- The Yellow Taxi dataset is bigger than the Green Taxi dataset, the processing time of the Yellow Taxi dataset is longer.

- The *yellow_merge_data* task took 39 minutes to complete, which is the longest task.

### b. Challanges

- Utilize Docker Compose to set up and run multiple containers, creating a seamless workflow. Configure connections between different services, including linking PG Admin to the PostgreSQL database and integrating the Kestra workflow with the PostgreSQL database.

- the volumes of the yellow taxi dataset is too large to load from local machine to Cloud Storage using Kestra. I had to use Python code to upload raw Parquet files into Cloud Storage. This is the `web_to_gcs` file. Results: it took about 30 seconds to successfully upload Parquet files from data source on the website into Google CLoud Storage.

- 




