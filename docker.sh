info() {
    echo -e "\n\033[32m$1\033[0m"
}

notice() {
    echo -e "\n\033[34m$1\033[0m"
}

if [ "$1" = "up" ]; then
    docker compose -f ./docker/docker-compose.yml down

    # 디렉토리가 없으면 생성
    if [ ! -d "volumes/prometheus/config" ] || [ ! -d "volumes/alertmanager/config" ]; then
        # 디렉토리가 없는 경우에만 생성 및 권한 부여
        mkdir -p volumes/prometheus/config
        mkdir -p volumes/alertmanager/config
        
        info "[New directories created. Setting permissions...]"
        sudo chown -R $(whoami) volumes
        sudo chmod -R 777 volumes
        info "[Permissions granted]"
    fi

    # Prometheus 설정 파일 복사
    cp -r config/prometheus/* volumes/prometheus/config/
    
    # AlertManager 설정 파일 복사
    cp -r config/alertmanager/* volumes/alertmanager/config/
    
    # Grafana 설정 파일 복사
    # cp -r config/grafana/* volumes/grafana/config/

    notice "Config files copied to volumes directory"

    docker compose -f ./docker/docker-compose.yml up -d --build

    info "[Container Started]"
    exit 0
    # docker logs -ft pm2-exporter
fi

if [ "$1" = "down" ]; then
    docker compose -f ./docker/docker-compose.yml down

    info "[Container Removed]"
    exit 0
fi

if [ "$1" = "permission" ]; then
    sudo chown -R $(whoami) volumes
    sudo chmod -R 777 volumes

    info "[Folder Permission Granted]"
    exit 0
fi

exit 1

# docker compose 실행시 폴더 쓰기 권한 에러 발생시 다음 명령어를 통해 폴더 권한 부여
sudo chown -R $(whoami) volumes
sudo chmod -R 777 volumes
