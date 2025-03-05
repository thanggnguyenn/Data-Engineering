import argparse
import os
import pandas as pd
from time import time
from sqlalchemy import create_engine

def main(params):
    user = params.user
    password = params.password
    host = params.host
    port = params.port
    db = params.db
    table_name = params.table_name
    url=params.url
    parquet_name = 'output.parquet'

    # download the CSV
    os.system(f"wget {url} -O {parquet_name}")


    # connect to postgresql
    engine = create_engine(f"postgresql://{user}:{password}@{host}:{port}/{db}")
    engine.connect()

    # read parquet file
    df = pd.read_parquet(parquet_name)
    df.to_csv("Taxi_data.csv")
    # print(pd.io.sql.get_schema(df,name=table_name, con=engine))
    # print("Schema created!")

    # read CSV file
    df_iter = pd.read_csv("Taxi_data.csv", iterator=True, chunksize=100000)
    print("CSV file is created and read!")

    # first iteraton
    df1 = next(df_iter)
    print(len(df1))

    df1.head(n=0).to_sql(name=table_name, con=engine, if_exists='replace')
    t_start = time()
    df1.to_sql(name=table_name, con=engine, if_exists='append')
    t_end = time()
    print(f"Wait time: {t_end - t_start}")

    # iterate through the df_iter and insert into the database
    while True:

        df2 = next(df_iter)
        
        t_start = time()
        df2.to_sql(name=table_name, con=engine, if_exists='append')
        t_end = time()
        print("Inserted another chunk ..., took %.3f seconds" % (t_end - t_start))

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Ingest CSV data to Postgres')

    parser.add_argument('--user', help='user name for postgres')
    parser.add_argument('--password', help='password for postgres')
    parser.add_argument('--host', help='host for postgres')
    parser.add_argument('--port', help='port for postgres')
    parser.add_argument('--db', help='database name for postgres')
    parser.add_argument('--table_name', help='name of the table where we will write results to')
    parser.add_argument('--url', help='url of the csv file')

    args = parser.parse_args()
    print(args)
    main(args)


