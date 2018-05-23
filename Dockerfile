FROM python:2

# rsync and pylint
RUN apt update && apt install rsync -y && apt install pylint -y

# sonar
ADD sonar-scanner-3.1.0.1141-linux/ /opt/sonar-scanner/
ENV PATH "$PATH:/opt/sonar-scanner/bin"

# airflow
ENV AIRFLOW_HOME /airflow
RUN pip install "apache-airflow[hive,hdfs,crypto,s3]"
RUN airflow initdb


EXPOSE 8080

WORKDIR ${AIRFLOW_HOME}
CMD airflow webserver -p 8080
