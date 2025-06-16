FROM node:16-alpine

WORKDIR /app

# Git 설치
RUN apk add --no-cache git

# React 서비스 클론
RUN git clone https://github.com/Inisw6/moard-model-admin-ui.git /app

# 의존성 설치
RUN npm install

# 개발 서버 포트 노출
EXPOSE 3000

# 개발 서버 실행
CMD ["npm", "start"] 