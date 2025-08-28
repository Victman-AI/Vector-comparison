FROM python:3.11

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --ignore-installed uvicorn==0.20.0

RUN pip install --no-cache-dir -r /code/requirements.txt

COPY ./app /code/app

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
#uvicorn.run("app.main:app", host="0.0.0.0", port=8000, reload=True)
#CMD python3 -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

#ENTRYPOINT ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]