# Data-Engineering

## Introduction

Learn the core principles of data engineering by constructing a complete data pipeline from the ground up. Develop practical skills using industry-standard tools and best practices.

This repository is based on the [Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp) by DataTalksClub.

## Index

**1. Docker**

- Docker and Docker Compose to build and run one image or many images in one file.

- Running PostgreSQL with Docker to create a data pipeline to ingest data from [NYC_TLC](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page) into the database.

- Run the entire workflow in the cloud with Google Cloud Platform. First, create VM instance (Compute Engine), then install `Anaconda, Docker, Docker Compose, PostgreSQL, pgcli` to run the workflow. Accessing the remote machine with VS Code and SSH remote.

**2. Kestra**

- Workflow orchestration with Kestra: use Kestra to automate the above workflow. You can shcedule to run on the first day of every month to collect data using Trigger. Another function is that to backfill missing months before the current month.


