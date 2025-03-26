FROM node:18.17.1-alpine
WORKDIR /app

EXPOSE 9209

# PM2 홈 디렉토리 환경변수 설정
ENV PM2_HOME=/root/.pm2

# 종료 신호 처리 개선을 위한 진입점 스크립트 추가
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# ENTRYPOINT를 사용하여 신호 처리 개선
ENTRYPOINT ["/entrypoint.sh"]
# CMD ["node", "exporter.js"]