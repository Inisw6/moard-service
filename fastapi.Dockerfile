FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/Inisw6/moard-ai-fastapi.git .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "app.main:app"] 