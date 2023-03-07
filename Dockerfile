FROM python:alpine

RUN mkdir -p /app
COPY . run.py /app/
WORKDIR /app
RUN pip install -r requirements.txt

CMD [ "run.py" ]
ENTRYPOINT [ "python" ]