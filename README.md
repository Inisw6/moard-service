# moard-service

## 개요
이 프로젝트는 **강화학습 추천시스템의 서비스 제공**을 위한 프로젝트입니다. 
사용자에게 개인화된 콘텐츠를 추천하는 기능을 제공하며, FastAPI, Spring Boot, React를 사용한 마이크로서비스 아키텍처로 구성되어 있습니다.

## 환경
- FastAPI (Python)
- Spring Boot (Java)
- React (JavaScript)
- MySQL 8.0
- Redis 7
- Docker & Docker Compose

## 환경 변수 설정
프로젝트 루트 디렉토리에 `.env` 파일을 생성하고 다음 환경 변수들을 설정해야 합니다:

```env
NAVER_CLIENT_ID=your-naver-client-id
NAVER_CLIENT_SECRET=your-naver-client-secret
YOUTUBE_API_KEYS=your-youtube-api-key-1,your-youtube-api-key-2
```

## 실행방법
1. Docker와 Docker Compose가 설치되어 있어야 합니다.
2. 프로젝트 루트 디렉토리에서 다음 명령어를 실행합니다:
```bash
docker-compose up --build
```

서비스 접속 정보:
- React 프론트엔드: http://localhost:3000
- Spring Boot API: http://localhost:8080
- FastAPI 서비스: http://localhost:8000

## 서비스 구조
### 데이터베이스
MySQL 데이터베이스는 다음과 같은 주요 테이블을 포함합니다:
- users: 사용자 정보
- stock_info: 주식 종목 정보
- search_queries: 검색 쿼리 기록
- contents: 콘텐츠 정보
- recommendations: 추천 정보
- stock_logs: 주식 조회 로그
- user_logs: 사용자 행동 로그

### 마이크로서비스
1. FastAPI 서비스 (Port: 8000)
   - Redis를 활용한 캐싱 서비스
   - 실시간 데이터 처리

2. Spring Boot 서비스 (Port: 8080)
   - 주요 비즈니스 로직 처리
   - MySQL 데이터베이스 연동
   - RESTful API 제공

3. React 프론트엔드 (Port: 3000)
   - 사용자 인터페이스
   - Spring Boot API와 통신

### 네트워크
- 모든 서비스는 `app-network`라는 Docker 네트워크를 통해 통신
- 각 서비스는 독립적인 컨테이너로 실행
- 볼륨을 통한 데이터 영속성 보장