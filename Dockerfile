FROM ubuntu:22.04

RUN apt-get update && apt-get install rename -y && rm -rf /var/lib/apt/lists/*

ARG WORKDIR_PATH=/usr/src

WORKDIR $WORKDIR_PATH

COPY selects $WORKDIR_PATH/selects
COPY overlap-analysis.sh $WORKDIR_PATH/overlap-analysis.sh
RUN chmod +x $WORKDIR_PATH/overlap-analysis.sh

RUN ./overlap-analysis.sh $(find "$WORKDIR_PATH/selects" -mindepth 1 -maxdepth 1 -type d)

CMD cat overlap.csv
