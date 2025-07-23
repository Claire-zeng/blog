#!/bin/bash

# GitHub Pages 部署脚本
# 使用方法: ./deploy.sh

echo "🚀 开始部署到 GitHub Pages..."

# 检查是否在正确的目录
if [ ! -f "config.toml" ]; then
    echo "❌ 错误：请在博客根目录下运行此脚本"
    exit 1
fi

# 构建静态文件
echo "📦 构建静态文件..."
hugo --minify

if [ $? -ne 0 ]; then
    echo "❌ 构建失败"
    exit 1
fi

echo "✅ 构建完成"

# 检查是否有Git仓库
if [ ! -d ".git" ]; then
    echo "📝 初始化Git仓库..."
    git init
    git add .
    git commit -m "feat: 初始化数值优化博客"
fi

# 检查是否有远程仓库
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "⚠️  请先设置GitHub远程仓库："
    echo "git remote add origin https://github.com/你的用户名/你的仓库名.git"
    echo ""
    echo "或者运行以下命令创建新仓库："
    echo "gh repo create 你的仓库名 --public --source=. --remote=origin --push"
    exit 1
fi

# 推送到GitHub
echo "📤 推送到GitHub..."
git add .
git commit -m "feat: 更新博客内容 $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ 部署成功！"
    echo "🌐 你的博客将在几分钟后上线："
    echo "https://你的用户名.github.io/你的仓库名"
else
    echo "❌ 推送失败，请检查网络连接和GitHub权限"
fi 