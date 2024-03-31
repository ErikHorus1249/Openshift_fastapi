FROM python:3.10-slim-buster

WORKDIR /backend

RUN apt-get update \
    && apt-get install -y \
    gcc python3-dev musl-dev  \
    libffi-dev netcat vim

COPY ./main.py /backend/
COPY ./requirements.txt /backend

RUN pip install -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]

EXPOSE 5000