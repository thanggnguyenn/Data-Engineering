# Workflow Orchestration with Kestra

[Kestra](https://kestra.io/) is an open-source, event-driven orchestration platform that simplifies building both scheduled and event-driven workflows. By adopting Infrastructure as Code practices data and process orchestration, Kestra enables you to build reliable workflows with just a few lines of YAML.

In this section, I will use Kestra to build a workflow to load data into databases (both local and Google cloud platform). Later on, I will use the shcedule feature to automatically run the workflow on the first day of each month.

For the information on how the workflow process, you can see in this presentation here.

I will present the results and challanges of two options:

**1. Local database**

The workflow of this option is in the file `01-postgres_taxi.yml`

**a. Results**

Processing time of the Green Taxi dataset: loaded 1206603 rows of data (January and February of 2019) into the databases in roughly 7 minutes.

Processing time of the Yellow Taxi dataset: took about 45 minutes to run successfully the workflow.

Since the Yellow Taxi dataset is bigger than the Green Taxi dataset, the processing time of the Yellow Taxi dataset is longer.

The *yellow_add_unique_id_and_filename* task had two attempts (the first one failed and the second one run successfully in 10 minutes).

The *yellow_merge_data* task took 39 minutes to complete, which is the longest task.

**b. Challenges and Errors**

Utilize Docker Compose to set up and run multiple containers, creating a seamless workflow. Configure connections between different services, including linking PG Admin to the PostgreSQL database and integrating the Kestra workflow with the PostgreSQL database.

**2. Google Cloud Platform**

Successfully uploaded the green taxi dataset into BigQuery table.

However, the volumes of the yellow taxi dataset is too large to load from local machine to Cloud Storage using Kestra. I had to use Python code to upload raw Parquet files into Cloud Storage. This is the `web_to_gcs` file. Results: it took about 30 seconds to successfully upload Parquet files from data source on the website into Google CLoud Storage.



