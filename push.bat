@echo off
chcp 65001 >nul

echo.
echo ==================================
echo 正在同步笔记到 GitHub...
echo ==================================
echo.

git add .

git diff --cached --quiet

if %errorlevel%==0 (
    echo 没有检测到新的修改，无需同步。
    echo.
    pause
    exit
)

set /p msg=请输入本次更新说明（直接回车使用默认说明）:

if "%msg%"=="" (
    set msg=更新学习笔记
)

git commit -m "%msg%"

git push

echo.
echo ==================================
echo 同步完成！
echo ==================================
echo.

pause