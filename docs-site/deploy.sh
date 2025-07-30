#!/bin/bash

# 觉察之美网站部署脚本

echo "🌸 开始部署《觉察之美》网站..."

# 检查是否安装了必要的工具
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 未安装，请先安装 Python3"
    exit 1
fi

if ! command -v pip &> /dev/null; then
    echo "❌ pip 未安装，请先安装 pip"
    exit 1
fi

# 创建虚拟环境
echo "📦 创建虚拟环境..."
python3 -m venv venv
source venv/bin/activate

# 安装依赖
echo "📥 安装依赖包..."
pip install -r requirements.txt

# 构建网站
echo "🏗️ 构建网站..."
mkdocs build

# 检查构建结果
if [ -d "site" ]; then
    echo "✅ 网站构建成功！"
    echo "📁 静态文件位于: ./site/"
    echo "🌐 运行 'mkdocs serve' 开始本地预览"
    echo "🔗 预览地址: http://127.0.0.1:8000"
else
    echo "❌ 网站构建失败"
    exit 1
fi

echo "🎉 部署完成！"