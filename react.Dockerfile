FROM node:16-alpine

WORKDIR /app

# Git 설치
RUN apk add --no-cache git

# React 서비스 클론
RUN git clone https://github.com/Inisw6/moard-model-admin-ui.git /app

# 의존성 설치 및 빌드
RUN npm install
RUN npm run build

# nginx 설치 및 설정
FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"] 