# pull this image FROM apache/airflow:2.7.1-python3.9
# Using "FROM apache/airflow:2.7.1-python3.9" in your Dockerfile means that your Docker container will run Python 3.9,
# regardless of what Python version you have installed locally (like Python 3.12.6).
FROM apache/airflow:2.7.1-python3.9

# copy requirements.txt(from apache/airflow:2.7.1-python3.9) into /opt/airflow/
COPY requirements.txt /opt/airflow/

# we switch to the user root so we can run: apt-get update && apt-get install -y gcc python3-dev
USER root
RUN apt-get update && apt-get install -y gcc python3-dev

# then we switch back to the airflow USER and we can run the installation
USER airflow

RUN pip install --no-cache-dir -r /opt/airflow/requirements.txt