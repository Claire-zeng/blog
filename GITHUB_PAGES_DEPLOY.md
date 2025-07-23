# GitHub Pages 部署指南

本指南将帮助你将数值优化博客部署到GitHub Pages上。

## 🚀 快速部署

### 方法1：使用部署脚本（推荐）

```bash
# 1. 确保在博客目录下
cd ~/blog/numOpt

# 2. 运行部署脚本
./deploy.sh
```

### 方法2：手动部署

```bash
# 1. 构建静态文件
hugo --minify

# 2. 初始化Git仓库（如果还没有）
git init
git add .
git commit -m "feat: 初始化数值优化博客"

# 3. 推送到GitHub
git remote add origin https://github.com/你的用户名/你的仓库名.git
git push -u origin main
```

## 📋 详细步骤

### 1. 创建GitHub仓库

1. 访问 [GitHub](https://github.com)
2. 点击 "New repository"
3. 仓库名称：`your-repo-name`（例如：`numerical-optimization-blog`）
4. 选择 "Public"
5. 不要初始化README（我们会推送现有代码）

### 2. 配置本地仓库

```bash
# 进入博客目录
cd ~/blog/numOpt

# 初始化Git仓库
git init

# 添加所有文件
git add .

# 提交初始版本
git commit -m "feat: 初始化数值优化博客"

# 添加远程仓库
git remote add origin https://github.com/你的用户名/你的仓库名.git

# 推送到GitHub
git push -u origin main
```

### 3. 启用GitHub Pages

1. 在GitHub仓库页面，点击 "Settings"
2. 左侧菜单选择 "Pages"
3. Source选择 "GitHub Actions"
4. 保存设置

### 4. 配置自动部署

GitHub Actions工作流已经配置好，位于 `.github/workflows/deploy.yml`。

每次推送到 `main` 分支时，会自动：
- 构建Hugo静态文件
- 部署到GitHub Pages

### 5. 更新baseURL

编辑 `config.toml` 文件，将 `baseURL` 改为你的实际URL：

```toml
baseURL = "https://你的用户名.github.io/你的仓库名/"
```

## 🔧 常用命令

### 本地开发

```bash
# 启动开发服务器
./start_server.sh

# 构建生产版本
hugo --minify
```

### 部署更新

```bash
# 添加更改
git add .

# 提交更改
git commit -m "feat: 更新博客内容"

# 推送到GitHub（自动触发部署）
git push origin main
```

### 查看部署状态

1. 在GitHub仓库页面，点击 "Actions" 标签
2. 查看最新的工作流运行状态
3. 部署成功后，访问你的博客URL

## 🌐 访问你的博客

部署成功后，你的博客将在以下地址上线：

```
https://你的用户名.github.io/你的仓库名/
```

## 📝 注意事项

### 1. 仓库设置

- **仓库必须是公开的**（GitHub Pages免费版要求）
- **仓库名称**：建议使用描述性名称，如 `numerical-optimization-blog`
- **分支名称**：使用 `main` 分支

### 2. 文件结构

确保以下文件存在：
```
blog/numOpt/
├── .github/workflows/deploy.yml  # GitHub Actions配置
├── config.toml                   # Hugo配置
├── content/posts/                # 文章内容
├── themes/numerical-theme/       # 主题文件
└── deploy.sh                     # 部署脚本
```

### 3. 自定义域名（可选）

如果你想使用自定义域名：

1. 在仓库设置中添加自定义域名
2. 在 `config.toml` 中更新 `baseURL`
3. 添加 `CNAME` 文件到 `static/` 目录

### 4. 故障排除

#### 部署失败

1. 检查GitHub Actions日志
2. 确保所有文件都已提交
3. 验证 `config.toml` 配置正确

#### 页面显示错误

1. 检查 `baseURL` 配置
2. 确保所有链接都是相对路径
3. 验证主题文件完整性

## 🎉 成功部署后

1. **分享你的博客**：将URL分享给朋友和同事
2. **添加更多内容**：继续写数值优化相关的文章
3. **自定义主题**：根据需要调整样式和布局
4. **添加分析**：集成Google Analytics或百度统计

## 📚 相关资源

- [GitHub Pages 官方文档](https://pages.github.com/)
- [Hugo 部署指南](https://gohugo.io/hosting-and-deployment/)
- [GitHub Actions 文档](https://docs.github.com/en/actions)

祝你部署顺利！🚀 