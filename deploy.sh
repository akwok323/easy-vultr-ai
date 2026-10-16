#!/bin/bash

# 顏色設定
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}====== 開始在 Vultr 上部署 AI 輕量化環境 ======${NC}"

# 1. 檢查並安裝 Docker
if ! command -v docker &> /dev/null; then
    echo "正在安裝 Docker 與 Docker Compose..."
    sudo apt-get update -y
    sudo apt-get install -y curl iptables
    curl -fsSL https://docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
else
    echo -e "${GREEN}[✓] Docker 已安裝，跳過此步驟。${NC}"
fi

# 2. 建立專案目錄並下載配置檔
echo "正在設定專案目錄並下載 Docker Compose 配置..."
mkdir -p ~/vultr-ai && cd ~/vultr-ai

# 【核心優化】自動從您的 GitHub 倉庫下載最新的 docker-compose.yml
# 請記得將下方網址中的「您的帳號」修改為您的 GitHub 帳號
curl -sSL -o docker-compose.yml https://raw.githubusercontent.com/andersonkwok  /easy-vultr-ai/refs/heads/main/docker-compose.yml

if [ ! -f "docker-compose.yml" ]; then
    echo -e "${RED}[✗] 下載 docker-compose.yml 失敗，請檢查網路或網址！${NC}"
    exit 1
fi

# 3. 啟動 Docker 容器
echo "正在背景啟動 Ollama 與 Open WebUI..."
sudo docker compose up -d

# 4. 預先下載 DeepSeek 模型
echo "正在背景下載 DeepSeek-R1 模型，這需要幾分鐘，請稍候..."
sudo docker compose exec -d ollama ollama run deepseek-r1:1.5b

# 5. 獲取公網 IP 並顯示完成提示
SERVER_IP=$(curl -s ifconfig.me)
echo -e "${GREEN}====== 部署成功！ ======${NC}"
echo -e "請在瀏覽器輸入：${GREEN}http://${SERVER_IP}${NC} 即可開始與 DeepSeek 對話！"
