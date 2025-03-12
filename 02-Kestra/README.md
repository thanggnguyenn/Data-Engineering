# Workflow Orchestration with Kestra

[Kestra](https://kestra.io/) is an open-source, event-driven orchestration platform that simplifies building both scheduled and event-driven workflows. By adopting Infrastructure as Code practices data and process orchestration, Kestra enables you to build reliable workflows with just a few lines of YAML.

I would like to present the results of `postgres_taxi.yml` file

**1. Introduction**

Building an ETL pipeline to ingest the Yellow Taxi data from the [NYC Taxi and Limousine Commission - TLC](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page) and load it into a Postgres database. Starting with data extraction from CSV files, and load them into a local Postgres database running in a Docker container.

I used the data from this [link](https://github.com/DataTalksClub/nyc-tlc-data/releases) for the workflow.

**2. Execution Process**

- Input: Define the year, month, and taxi type (yellow or green) to determine the appropriate processing workflow.

- Dynamic Variables: Generate variables dynamically based on the provided input.

- Data Extraction: Retrieve data from the website using Linux/Bash commands.

- Database Operations:

    - Execute SQL queries to create two types of tables: a main table and a staging table, along with their respective schemas.
    
    - Firt load extracted data into the staging table then into to the main table.
  
    - In the staging table, assign a unique ID to each row using the MD5 hash function to prevent duplicate records.

- Docker Integration: Establish connections between multiple services using Docker Compose, including Kestra, a PostgreSQL database, and PG Admin for database visualization.

**Image of the entire workflow with Kestra's topology.**

![Image of the entire workflow with Kestra's topology.](https://github.com/user-attachments/assets/34113dff-6e4c-4981-97ed-459ee5e9b921)

![If yellow taxi](https://github.com/user-attachments/assets/8ed30c97-505a-4f8c-ab3f-c2e077274b82)

![If green taxi](https://github.com/user-attachments/assets/0ade45ca-d322-4188-99ea-23c09083f92e)



**3. Observed Results**

Processing time of the Green Taxi dataset: loaded 1206603 rows of data (January and February of 2019) into the databases in roughly 7 minutes.

Processing time of the Yellow Taxi dataset: took about 45 minutes to run successfully the workflow.

Since the Yellow Taxi dataset is bigger than the Green Taxi dataset, the processing time of the Yellow Taxi dataset is longer.

**2019 January Green Taxi dataset processing time**

![image](https://github.com/user-attachments/assets/cc8e365d-dd08-417c-9e7f-f750cebcce09)

**2019 February Green Taxi dataset processing time**

![image](https://github.com/user-attachments/assets/a99fc44e-782a-498d-a673-8029a2f39ea6)

**2019 January Yellow Taxi dataset processing time**

![image](https://github.com/user-attachments/assets/0ccffeb5-faf6-42f6-b068-252805656925)

The *yellow_add_unique_id_and_filename* task had two attempts (the first one failed and the second one run successfully in 10 minutes).

The *yellow_merge_data* task took 39 minutes to complete, which is the longest task.

**4. Challenges and Errors**

Utilize Docker Compose to set up and run multiple containers, creating a seamless workflow. Configure connections between different services, including linking PG Admin to the PostgreSQL database and integrating the Kestra workflow with the PostgreSQL database.

**5. Conclusion**

Run successfully the ETL workflow.

