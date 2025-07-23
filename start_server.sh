#!/bin/bash

echo "启动数值优化博客服务器..."
echo "访问地址: http://localhost:1313"
echo "按 Ctrl+C 停止服务器"
echo ""

hugo server --bind 0.0.0.0 --port 1313 --disableFastRender 