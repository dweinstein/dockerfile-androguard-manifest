FROM dweinstein/androguard:latest
MAINTAINER dweinstein "dweinst@insitusec.com"

WORKDIR /opt/app/
ADD ./runner.sh /opt/app/runner.sh
ADD ./androguard_manifest.py /opt/app/androguard_manifest.py
ENTRYPOINT ["/opt/app/runner.sh"]
