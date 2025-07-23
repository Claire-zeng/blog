# 数值优化学习博客

这是一个基于Hugo的数值优化学习博客，专门用于记录和分享数值优化算法的学习笔记。

## 特性

- **现代化设计**：采用渐变色彩和卡片式布局
- **数学公式支持**：集成MathJax，完美显示LaTeX数学公式
- **代码高亮**：使用Prism.js，支持多种编程语言
- **响应式设计**：在手机和电脑上都有良好体验
- **中文优化**：针对中文内容进行了优化
- **自动部署**：支持GitHub Pages自动部署

## 快速开始

### 1. 启动开发服务器

```bash
# 在博客目录下运行
hugo server --bind 0.0.0.0 --port 1313
```

然后在浏览器中访问：http://localhost:1313

### 2. 创建新文章

```bash
# 创建新文章
hugo new posts/your-article-name.md
```

### 3. 文章格式

每篇文章的头部需要包含以下元数据：

```markdown
---
title: "文章标题"
date: 2024-01-15
categories: ["分类"]
tags: ["标签1", "标签2"]
draft: false
---

# 文章内容
```

## 部署到GitHub Pages

### 快速部署

```bash
# 1. 检查部署配置
./check_deploy.sh

# 2. 创建GitHub仓库并配置
# 3. 运行部署脚本
./deploy.sh
```

### 详细部署步骤

1. **创建GitHub仓库**
   - 访问 [GitHub](https://github.com)
   - 创建新的公开仓库
   - 仓库名称建议：`numerical-optimization-blog`

2. **配置本地仓库**
   ```bash
   git init
   git add .
   git commit -m "feat: 初始化数值优化博客"
   git remote add origin https://github.com/你的用户名/你的仓库名.git
   git push -u origin main
   ```

3. **启用GitHub Pages**
   - 在仓库设置中启用GitHub Pages
   - 选择 "GitHub Actions" 作为部署源

4. **更新配置**
   - 编辑 `config.toml` 中的 `baseURL`
   - 改为你的实际GitHub Pages URL

详细部署指南请参考：[GITHUB_PAGES_DEPLOY.md](GITHUB_PAGES_DEPLOY.md)

## 数学公式

支持行内公式和块级公式：

- 行内公式：`$f(x) = x^2 + 2x + 1$`
- 块级公式：`$$x_{k+1} = x_k - \alpha \nabla f(x_k)$$`

## 代码高亮

支持多种编程语言的语法高亮：

```python
def gradient_descent(f, grad_f, x0, alpha=0.01):
    x = x0
    for i in range(max_iter):
        grad = grad_f(x)
        x = x - alpha * grad
    return x
```

## 目录结构

```
blog/numOpt/
├── content/          # 文章内容
│   └── posts/       # 博客文章
├── themes/          # 主题文件
│   └── numerical-theme/
├── static/          # 静态文件
├── layouts/         # 布局文件
├── .github/         # GitHub Actions配置
├── config.toml      # 配置文件
├── deploy.sh        # 部署脚本
├── check_deploy.sh  # 部署检查脚本
└── README.md        # 说明文档
```

## 自定义主题

主题文件位于 `themes/numerical-theme/` 目录下：

- `layouts/` - HTML模板文件
- `static/css/` - CSS样式文件
- `theme.toml` - 主题配置

## 部署

### 本地构建

```bash
hugo --minify
```

构建后的文件在 `public/` 目录中。

### GitHub Pages自动部署

配置了GitHub Actions工作流，每次推送到 `main` 分支时自动部署：

1. 自动构建Hugo静态文件
2. 部署到GitHub Pages
3. 支持自定义域名

## 主题特性

### 颜色方案

- 主色调：紫色渐变 (#667eea → #764ba2)
- 背景色：浅灰色 (#f8f9fa)
- 文字色：深灰色 (#333)

### 布局特点

- 固定宽度容器（最大1200px）
- 响应式网格布局
- 卡片式文章展示
- 悬停动画效果

### 数学公式样式

- 居中对齐
- 适当的外边距
- 清晰的字体渲染

## 维护

### 添加新功能

1. 修改主题文件
2. 更新CSS样式
3. 测试响应式效果

### 更新内容

1. 编辑 `content/posts/` 中的Markdown文件
2. 保存后Hugo会自动重新构建
3. 刷新浏览器查看效果

### 部署更新

```bash
# 添加更改
git add .

# 提交更改
git commit -m "feat: 更新博客内容"

# 推送到GitHub（自动触发部署）
git push origin main
```

## 脚本说明

- `start_server.sh` - 启动开发服务器
- `deploy.sh` - 部署到GitHub Pages
- `check_deploy.sh` - 检查部署配置

## 许可证

MIT License 