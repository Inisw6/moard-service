FROM python:3.10-slim

WORKDIR /app

# Git 설치
RUN apt-get update && apt-get install -y git

# FastAPI 서비스 클론
RUN git clone https://github.com/Inisw6/moard-ai-fastapi.git /app

# 의존성 설치
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"] 