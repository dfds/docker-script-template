FROM python:slim

RUN apt update \
    && apt install -y curl

RUN mkdir sandbox

COPY src sandbox/

WORKDIR sandbox

RUN chmod +x entrypoint.sh \
    && useradd -d /sandbox -s /bin/bash sandbox \
    && chown -R sandbox:sandbox /sandbox

USER sandbox

ENTRYPOINT ["./entrypoint.sh"]
