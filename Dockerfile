FROM python:3.11-slim

WORKDIR /home/dev

RUN apt-get update && \
    apt-get install -y default-jdk curl && \
    rm -rf /var/lib/apt/lists/*

RUN export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
ENV JAVA_HOME=$JAVA_HOME
ENV PATH=$JAVA_HOME/bin:$PATH

RUN pip install --no-cache-dir \
    pyspark==3.5.2 \
    pandas \
    numpy==1.25.2 \
    matplotlib \
    jupyterlab \
    rich \
    networkx \
    tensorflow==2.14.0 \
    scikit-learn \
    pyarrow==12.0.1

EXPOSE 4040

CMD ["tail", "-f", "/dev/null"]
