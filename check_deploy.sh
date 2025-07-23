#!/bin/bash

echo "🔍 检查部署配置..."

# 检查是否在正确的目录
if [ ! -f "config.toml" ]; then
    echo "❌ 错误：请在博客根目录下运行此脚本"
    exit 1
fi

# 检查必要文件
echo "📁 检查必要文件..."

files=(
    "config.toml"
    ".github/workflows/deploy.yml"
    "themes/numerical-theme/layouts/_default/baseof.html"
    "themes/numerical-theme/static/css/style.css"
    "content/posts/gradient-descent.md"
)

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    else
        echo "❌ $file (缺失)"
    fi
done

# 检查Git仓库
echo ""
echo "📝 检查Git配置..."

if [ -d ".git" ]; then
    echo "✅ Git仓库已初始化"
    
    if git remote get-url origin > /dev/null 2>&1; then
        echo "✅ 远程仓库已配置"
        git remote get-url origin
    else
        echo "⚠️  远程仓库未配置"
        echo "请运行: git remote add origin https://github.com/你的用户名/你的仓库名.git"
    fi
else
    echo "⚠️  Git仓库未初始化"
    echo "请运行: git init"
fi

# 检查Hugo构建
echo ""
echo "🔨 测试Hugo构建..."

if hugo --minify > /dev/null 2>&1; then
    echo "✅ Hugo构建成功"
else
    echo "❌ Hugo构建失败"
    echo "请检查config.toml配置"
fi

# 检查baseURL配置
echo ""
echo "🌐 检查baseURL配置..."

baseurl=$(grep "baseURL" config.toml | head -1)
if [[ $baseurl == *"yourusername"* ]]; then
    echo "⚠️  baseURL需要更新"
    echo "当前配置: $baseurl"
    echo "请更新为你的实际GitHub Pages URL"
else
    echo "✅ baseURL已配置"
    echo "$baseurl"
fi

echo ""
echo "📋 部署检查完成！"
echo ""
echo "下一步："
echo "1. 创建GitHub仓库"
echo "2. 更新config.toml中的baseURL"
echo "3. 运行 ./deploy.sh 进行部署" 