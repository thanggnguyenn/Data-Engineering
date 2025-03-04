# Workflow Orchestration with Kestra

[Kestra](https://kestra.io/) is an open-source, event-driven orchestration platform that simplifies building both scheduled and event-driven workflows. By adopting Infrastructure as Code practices data and process orchestration, Kestra enables you to build reliable workflows with just a few lines of YAML.

I would like to present the results of `postgres_taxi.yml` file

**1. Introduction**

This file is to build ETL pipelines for Yellow and Green Taxi data from [NYC’s Taxi and Limousine Commission - TLC](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page).
I'm going to use the data from this [link](https://github.com/DataTalksClub/nyc-tlc-data/releases) for the workflow.

Expected outcome: load the data from the website into the Postgres database.

**2. Execution Process**

A walkthrough some important points:

 - Chose the dataset to download in which year and month.

 - Generated some variables dynamically based on the previous step.

 - Excecuted the process based on the Yellow or Green Taxi data (because they had different schemas).

 - Used SQL queries to: create two types of table (the main table and the staging table), the schema for each table, load the data into the databases.
    
    - 

- Connection between different images using Docker Compose: Kestra, Postgres database, PG Admin (to view the database).

- ![Image of the entire workflow with Kestra's topology.]()

**3. Observed Results**

Processing time of the Green Taxi dataset:

Processing time of the Yellow Taxi dataset:

Since the Yellow Taxi dataset is bigger than the Green Taxi dataset, the processing time of the Yellow Taxi dataset is longer.

**4. Challenges and Errors**

Use Docker Compose to setup and run many images to create a complete workflow, configured connection between different images: connection from PG Admin to Postgres database, connection from Kestra workflow to Postgres database.

**5. Conclusion**

Run successfully the ETL workflow.

