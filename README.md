# ⚡ Easy Vultr AI (vultr-oneclick-llm)

[![GitHub Stars](https://img.shields.io/github/stars/andersonkwok/easy-vultr-ai)]
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
![Docker Pulls](https://img.shields.io/docker/pulls/ollama/ollama)

[繁體中文](#繁體中文) | [English](#english)

---

## 繁體中文

一個專為 Vultr 雲端主機優化的 **「一鍵自動部署腳本」**。只需 5 分鐘，自動幫您架設好私有化的 **DeepSeek-R1 / Llama 3** 運行環境，並內建極其流暢、類似 ChatGPT 的漂亮網頁介面（Open WebUI）！

### ✨ 核心特色
* **🚀 真正一鍵部署**：無須任何 Linux 運維經驗，複製貼上一行指令，Docker、Ollama、WebUI 全部自動搞定。
* **💰 極致省錢（CPU 優化）**：完美契合 Vultr 的平價平臺（如 \$5-10/月方案）。預設採用輕量高效的 `DeepSeek-R1:1.5b` 模型，沒有 GPU 也能流暢對話。
* **🔒 100% 隱私安全**：所有資料與對話完全保留在您的 Vultr 伺服器本地端，拒絕資料外洩。
* **🎨 開箱即用**：內建整合最新版 Open WebUI，支援語音輸入、文件上傳分析（RAG）與歷史紀錄管理。

---

## English

A **one-click automated deployment script** optimized specifically for Vultr cloud servers. In just 5 minutes, it automatically sets up your private **DeepSeek-R1 / Llama 3** runtime environment, complete with a beautiful, smooth, ChatGPT-like web interface (Open WebUI)!

### ✨ Key Features
* **🚀 True One-Click Deployment**: Zero Linux DevOps experience required. Copy and paste a single command, and Docker, Ollama, and WebUI are all set up automatically.
* **💰 Ultra Budget-Friendly (CPU Optimized)**: Perfectly tailored for Vultr's affordable instances (e.g., \$5-10/month plans). Runs the lightweight and efficient `DeepSeek-R1:1.5b` model by default—no GPU required.
* **🔒 100% Privacy & Security**: All data and conversations remain completely local to your Vultr server. No data leaks.
* **🎨 Ready to Use**: Integrated with the latest Open WebUI, supporting voice input, document analysis (RAG), and chat history management.

---

## 🏗️ 系統架構 (Architecture)

```text
[User Browser / 使用者瀏覽器] ➔ 🌎 Internet / 網路 ➔ [Vultr VPS Server]
                                                    │
                                                    ├── 🐳 Docker Compose
                                                    │     ├── 🌐 Open WebUI (Port 80)
                                                    │     └── 🧠 Ollama Backend (Port 11434)
                                                    └────── 📦 DeepSeek-R1 Model
```
---

## 🛠️ 快速上手 (Quick Start)

### Step 1: 準備您的 Vultr 伺服器 (Prepare Your Vultr Server)
在 Vultr 後台部署一台新的雲端主機（Deploy a new instance on Vultr）:
* **OS / 作業系統**: **Ubuntu 22.04 LTS** or **Ubuntu 24.04 LTS**.
* **Specs / 規格**: At least 1 vCPU / 2GB RAM (Intel/AMD High Performance recommended).

### Step 2: 執行一鍵部署指令 (Run the One-Click Command)
使用 SSH 連線進入您的 Vultr 伺服器，複製並執行以下指令 (SSH into your Vultr server, copy and run the following command):

```bash
curl -sSL https://raw.githubusercontent.com/andersonkwok/easy-vultr-ai/main/deploy.sh | bash
```

### Step 3: 開始對話！ (Start Chatting!)
腳本執行完成後，打開瀏覽器輸入您的伺服器 IP (Once the script finishes, open your browser and navigate to):
```text
http://YOUR_SERVER_IP
```
註冊第一個帳號（即為管理員），即可開始與 DeepSeek-R1 對話！ (Sign up for the first account—this will be the admin—and start chatting with DeepSeek-R1!)

---

## ⚙️ 進階調整 (Advanced Configuration)

如果您想更換其他模型，可以在部署完成後進入伺服器執行以下指令 (To switch to other models, run the following commands inside your server after deployment):

```bash
# Download DeepSeek 7B (Requires 8GB+ RAM / 建議 8GB 以上記憶體)
sudo docker compose exec -d ollama ollama run deepseek-r1:7b

# Download Meta Llama 3 8B
sudo docker compose exec -d ollama ollama run llama3
```

---

## 📄 開源協議 (License)

本專案採用 [MIT License](LICENSE) 協議開源。
This project is open-sourced under the [MIT License](LICENSE).

---

## ⭐ 支持我們 (Support Us)

如果您覺得這個專案有幫助，請幫忙點擊右上角的 **⭐ Star**！
If you find this project helpful, please give us a **⭐ Star** on the top right!
