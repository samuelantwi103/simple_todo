FROM python:3-alpine3.16
WORKDIR /appfoldername
COPY . /appfoldername
RUN pip install -r requirements.txt
EXPOSE 3000 



CMD ["python3","-m","flask","run","--host=0.0.0.0"]




