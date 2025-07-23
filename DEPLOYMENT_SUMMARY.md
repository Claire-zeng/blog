# 🚀 GitHub Pages 部署总结

## 📋 部署前准备

### 1. 检查当前状态

```bash
cd ~/blog/numOpt
./check_deploy.sh
```

### 2. 需要完成的配置

- [ ] 创建GitHub仓库
- [ ] 更新 `config.toml` 中的 `baseURL`
- [ ] 初始化Git仓库
- [ ] 配置远程仓库

## 🎯 快速部署流程

### 步骤1：创建GitHub仓库

1. 访问 [GitHub](https://github.com)
2. 点击 "New repository"
3. 仓库名称：`numerical-optimization-blog`
4. 选择 "Public"
5. 不要初始化README

### 步骤2：更新配置

编辑 `config.toml` 文件：

```toml
baseURL = "https://你的用户名.github.io/numerical-optimization-blog/"
```

### 步骤3：初始化并推送

```bash
# 初始化Git仓库
git init

# 添加所有文件
git add .

# 提交初始版本
git commit -m "feat: 初始化数值优化博客"

# 添加远程仓库
git remote add origin https://github.com/你的用户名/numerical-optimization-blog.git

# 推送到GitHub
git push -u origin main
```

### 步骤4：启用GitHub Pages

1. 在GitHub仓库页面，点击 "Settings"
2. 左侧菜单选择 "Pages"
3. Source选择 "GitHub Actions"
4. 保存设置

## 🔧 自动化部署

### GitHub Actions工作流

已配置的自动化流程：

```yaml
# .github/workflows/deploy.yml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          extended: true
      
      - name: Build with Hugo
        run: hugo --gc --minify
      
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./public

  deploy:
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        uses: actions/deploy-pages@v4
```

### 部署脚本

使用提供的脚本进行部署：

```bash
# 检查部署配置
./check_deploy.sh

# 执行部署
./deploy.sh
```

## 📁 文件结构

```
blog/numOpt/
├── .github/workflows/deploy.yml  # GitHub Actions配置
├── content/posts/                # 文章内容
├── themes/numerical-theme/       # 自定义主题
├── config.toml                   # Hugo配置
├── deploy.sh                     # 部署脚本
├── check_deploy.sh              # 部署检查脚本
├── start_server.sh              # 开发服务器启动脚本
└── README.md                    # 项目说明
```

## 🌐 访问地址

部署成功后，你的博客将在以下地址上线：

```
https://你的用户名.github.io/numerical-optimization-blog/
```

## 📝 更新流程

### 添加新文章

```bash
# 创建新文章
hugo new posts/your-article-name.md

# 编辑文章内容
# 保存文件

# 提交并推送
git add .
git commit -m "feat: 添加新文章"
git push origin main
```

### 修改主题

```bash
# 编辑主题文件
# themes/numerical-theme/static/css/style.css

# 提交并推送
git add .
git commit -m "style: 更新主题样式"
git push origin main
```

## 🔍 故障排除

### 常见问题

1. **部署失败**
   - 检查GitHub Actions日志
   - 确保所有文件都已提交
   - 验证 `config.toml` 配置

2. **页面显示错误**
   - 检查 `baseURL` 配置
   - 确保所有链接都是相对路径
   - 验证主题文件完整性

3. **数学公式不显示**
   - 检查MathJax是否正确加载
   - 验证LaTeX语法是否正确

### 调试命令

```bash
# 本地构建测试
hugo --minify

# 检查构建结果
ls -la public/

# 检查Git状态
git status

# 检查远程仓库
git remote -v
```

## 🎉 部署完成后的下一步

1. **分享你的博客**
   - 将URL分享给朋友和同事
   - 在社交媒体上宣传

2. **添加更多内容**
   - 继续写数值优化相关的文章
   - 添加更多算法实现

3. **自定义主题**
   - 根据需要调整样式和布局
   - 添加更多功能

4. **添加分析**
   - 集成Google Analytics
   - 添加百度统计

5. **SEO优化**
   - 添加meta标签
   - 优化文章标题和描述

## 📚 相关文档

- [README.md](README.md) - 项目详细说明
- [QUICK_START.md](QUICK_START.md) - 快速开始指南
- [GITHUB_PAGES_DEPLOY.md](GITHUB_PAGES_DEPLOY.md) - 详细部署指南

祝你部署顺利！🚀 