# # Node.js LTS バージョンの公式イメージを使用
FROM node:20.17.0-slim

# 作業ディレクトリを設定(これ以降のコマンドは/workspace内で実行)
WORKDIR /workspace

# 必要なツールをインストール
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get upgrade -y \
    # && apt-get -y install --no-install-recommends <install packages> \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリを変更
WORKDIR /workspace/frontend    

# パッケージファイルをコピー
COPY frontend/package*.json ./

# 依存関係をインストール
RUN npm ci

# ソースコードをコピー
# COPY frontend/ .




# 作業ディレクトリを変更
WORKDIR /workspace/backend

# パッケージファイルをコピー
COPY backend/package*.json ./

# 依存関係をインストール
RUN npm ci

# ソースコードをコピー
# COPY backend/ .



# アプリケーションのポートを公開
EXPOSE 3000 8080

# 作業ディレクトリを変更
WORKDIR /workspace



# コンテナ起動時のデフォルトコマンド
#CMD ["npm", "start"]
