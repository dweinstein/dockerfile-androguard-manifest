FROM dweinstein/androguard:latest
MAINTAINER dweinstein "dweinst@insitusec.com"

ADD https://github.com/dweinstein/analysis-runner/archive/master.zip /tmp/runner.zip
RUN unzip -j /tmp/runner.zip -d /opt/runner && \
    rm -f /tmp/runner.zip

ADD ./androguard_manifest.py /opt/app/androguard_manifest.py
ENV TOOL ${PYTHON} ./androguard_manifest.py
ENV CONTENT_TYPE text/xml

WORKDIR /opt/app/
ENTRYPOINT ["/opt/runner/runner.sh", "${TOOL}"]

