FROM python:3.7-alpine

ARG manifest
LABEL "up42_manifest"=$manifest

WORKDIR /block
COPY . /block/

CMD ["python", "/block/run.py"]