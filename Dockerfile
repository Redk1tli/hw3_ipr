FROM python:3.13-slim
WORKDIR /app
COPY ./app/requirements.txt /app/
RUN pip install requirements.txt
COPY ./app .
EXPOSE 8000
CMD ["python" "app.py"]
