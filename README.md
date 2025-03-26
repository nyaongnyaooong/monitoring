# Prometheus 및 Grafana 설정

Prometheus를 이용해 exporter로부터 매트릭을 수집하고 Grafana를 이용해 시각화합니다.

## 필수 요소
- npm
- docker
- docker compose

## 구성 요소

1. **Prometheus**: exporter로부터 매트릭을 수집해여 저장합니다 (포트: 9090)
2. **AlertManager**: Prometheus의 수집한 데이터 중 특정 조건에 의해 alert를 실행합니다 (포트: 9093)
3. **Grafana**: Prometheus에 쿼리를 요청하여 수집한 매트릭을 시각화합니다 (포트: 4000)

## 설치 및 실행 방법

1. config 파일 내에 있는 alertmanager와 prometheus의 설정값을 수정합니다.

2. 프로젝트 디렉토리에서 다음 명령어를 실행합니다:

```bash
npm run docker up
```

## 문제해결
1. npm run docker up 실행시 권한 문제
```bash
> monitoring@1.0.0 docker
> ./docker.sh up

sh: ./docker.sh: Permission denied
```

다음 명령어를 통해 권한을 부여합니다
```bash
npm run permission
``` 

<!-- ## Prometheus 설정

다른 서버에 설치된 Prometheus에서 이 exporter를 스크래핑하려면:

1. `prometheus.yml` 파일에서 `YOUR_SERVER_IP`를 현재 서버의 실제 IP 주소로 변경합니다.
2. 해당 설정을 Prometheus 서버의 설정에 추가합니다. -->

## 주의사항

- volumes 폴더는 백업 용도 외에는 접근하지 않는 것을 추천합니다.
- 각 컨테이너의 config 파일 수정을 위해서는 config폴더 내에 있는 yml 파일을 수정하고 컨테이너를 재시작합니다.