# 快速开始指南

## 🚀 立即开始

### 1. 启动博客服务器

```bash
# 方法1：使用启动脚本
./start_server.sh

# 方法2：直接运行Hugo
hugo server --bind 0.0.0.0 --port 1313
```

### 2. 访问博客

打开浏览器访问：http://localhost:1313

## 📝 创建新文章

### 方法1：使用Hugo命令

```bash
hugo new posts/your-article-name.md
```

### 方法2：手动创建

在 `content/posts/` 目录下创建 `.md` 文件，使用以下格式：

```markdown
---
title: "文章标题"
date: 2024-01-15
categories: ["优化算法"]
tags: ["标签1", "标签2"]
draft: false
---

# 文章内容
```

## ✨ 特色功能

### 数学公式

- 行内公式：`$f(x) = x^2 + 2x + 1$`
- 块级公式：`$$x_{k+1} = x_k - \alpha \nabla f(x_k)$$`

### 代码高亮

支持多种编程语言：

```python
def gradient_descent(f, grad_f, x0, alpha=0.01):
    x = x0
    for i in range(max_iter):
        grad = grad_f(x)
        x = x - alpha * grad
    return x
```

### 响应式设计

- 在手机上自动调整布局
- 卡片式文章展示
- 悬停动画效果

## 🎨 自定义主题

主题文件位置：`themes/numerical-theme/`

- `layouts/` - HTML模板
- `static/css/style.css` - 样式文件
- `theme.toml` - 主题配置

## 📁 目录结构

```
blog/numOpt/
├── content/posts/     # 文章内容
├── themes/           # 主题文件
├── static/           # 静态资源
├── config.toml       # 站点配置
├── start_server.sh   # 启动脚本
└── README.md         # 详细文档
```

## 🔧 常用命令

```bash
# 启动开发服务器
hugo server --bind 0.0.0.0 --port 1313

# 构建生产版本
hugo --minify

# 创建新文章
hugo new posts/article-name.md

# 查看帮助
hugo --help
```

## 🌟 主题特性

- **现代化设计**：紫色渐变主题
- **数学公式**：MathJax支持
- **代码高亮**：Prism.js支持
- **响应式**：移动端友好
- **中文优化**：专门针对中文内容优化

## 📚 示例文章

博客已包含两篇示例文章：

1. **梯度下降算法详解** - 介绍梯度下降的基本原理
2. **牛顿法优化算法** - 介绍牛顿法的实现和应用

## 🚀 下一步

1. 阅读示例文章了解格式
2. 创建你自己的文章
3. 自定义主题样式
4. 部署到GitHub Pages

享受你的数值优化学习之旅！ 🎉 