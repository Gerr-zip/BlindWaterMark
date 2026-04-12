@echo off
chcp 65001 >nul
title 盲水印工具 - Web服务器

echo ========================================
echo   盲水印工具 Web 版
echo ========================================
echo.

echo 正在启动 Web 服务器...
echo.

:: 尝试使用 Python 启动服务器
python --version >nul 2>&1
if not errorlevel 1 (
    echo 使用 Python 启动服务器...
    start http://localhost:8080
    python -m http.server 8080
    goto :end
)

:: 如果没有 Python，尝试使用 Node.js
node --version >nul 2>&1
if not errorlevel 1 (
    echo 使用 Node.js 启动服务器...
    start http://localhost:8080
    npx http-server -p 8080
    goto :end
)

:: 如果都没有，提示安装
echo 错误：未检测到 Python 或 Node.js
echo.
echo 请安装以下任一环境：
echo 1. Python 3.x：https://www.python.org/downloads/
echo 2. Node.js：https://nodejs.org/
echo.
echo 或直接双击 index.html 文件使用（部分功能可能受限）
echo.
pause

:end