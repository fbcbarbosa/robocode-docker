FROM openjdk:8-jre-alpine

WORKDIR /robocode
ARG ROBOCODE_RELEASE=1.9.3.9

ENV FC_LANG=en-US \
    ROBO_LINK=https://sourceforge.net/projects/robocode/files/robocode/${ROBOCODE_RELEASE}/robocode-${ROBOCODE_RELEASE}-setup.jar/download

RUN apk add --no-cache ttf-dejavu openssl
RUN wget $ROBO_LINK -O /tmp/robocode-setup.jar
RUN unzip /tmp/robocode-setup.jar && \
    rm /tmp/robocode-setup.jar && \
    chmod 777 -R /robocode && \
    chmod +x robocode.sh

CMD env | sort && ./robocode.sh

