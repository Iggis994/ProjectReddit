# README file
pip install apache-airflow pandas numpy praw
- PRAW, an acronym for "Python Reddit API Wrapper", is a Python package that allows for simple access to Reddit's API


1. Creating directories: mkdir config dags data etls logs pipelines tests utils
2. Creating files: touch airflow.env docker-compose.yml Dockerfile
3. Writing docker-compose.yml, where:
              airflow-init:
               <<: *airflow-common
               command: >
                  bash -c "pip install -r /opt/airflow/requirements.txt && airflow db init && airflow db upgrade && airflow users create --username admin --firstname admin --lastname admin --role Admin --email airflow@airflow.com --password admin"
               restart: "no"
    - This is an initialization command: by the time the airflow is starting up it's going to start with the init command
and from there other services are going to inherit the same property from there and initialize the services.
    - So we have, the init command, the airflow-webserver, airflow-scheduler, airflow-worker, all inheriting airflow-common.
    - airflow-common is built from Dockerfile, contains env_file and volumes: we have excluded: # - ./airflow.cfg:/opt/airflow/airflow.cfg
because if you don't have this file in root directory, it's going to create it as a folder and map it into the Container.
We don't want that for now.
4. Dockerfile writing: explained in file.
