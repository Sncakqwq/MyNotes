# GitHub 笔记同步方法

## 一、整体原理

```
本地 MyNotes 文件夹
        ↓
     Git 管理
        ↓
   git commit 保存版本
        ↓
   git push 上传
        ↓
GitHub 云端仓库
```

------

# 二、首次配置

## 1. 创建 GitHub 仓库

在 GitHub 创建一个仓库，例如：

```
MyNotes
```

复制仓库 HTTPS 地址：

```
https://github.com/用户名/MyNotes.git
```

------

## 2. 本地初始化 Git

进入笔记文件夹，例如：

```
MyNotes
```

打开 Git Bash：

```
git init -b main
```

------

## 3. 第一次提交

```
git add .
git commit -m "First commit"
```

------

## 4. 连接 GitHub 仓库

```
git remote add origin https://github.com/用户名/MyNotes.git
```

检查连接：

```
git remote -v
```

------

## 5. 上传到 GitHub

```
git push -u origin main
```

------

# 三、Clash Verge 代理配置

如果 Git 无法连接 GitHub，而浏览器可以正常打开 GitHub，可以让 Git 使用 Clash Verge 代理。

我的 Clash Verge 端口：

```
7897
```

配置 Git 代理：

```
git config --global http.proxy http://127.0.0.1:7897
git config --global https.proxy http://127.0.0.1:7897
```

查看代理：

```
git config --global --get http.proxy
git config --global --get https.proxy
```

⚠️ **以后同步 GitHub 时，需要打开 Clash Verge，否则 Git 可能无法连接 GitHub。**

------

# 四、日常同步流程

每次写完笔记：

```
git add .
git commit -m "更新说明"
git push
```

例如：

```
git add .
git commit -m "学习 Python 函数"
git push
```

------

# 五、一键同步 push.bat

在 `MyNotes` 文件夹中创建：

```
push.bat
```

内容：

```
@echo off
chcp 65001 >nul

echo 正在同步笔记到 GitHub...

git add .

git diff --cached --quiet

if %errorlevel%==0 (
    echo 没有新的修改，无需同步。
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
echo 同步完成！

pause
```

以后只需要：

```
写笔记
  ↓
保存
  ↓
双击 push.bat
  ↓
自动同步 GitHub
```

------

# 六、几个核心命令

| 命令                   | 作用                   |
| ---------------------- | ---------------------- |
| `git init`             | 创建 Git 仓库          |
| `git add .`            | 添加所有修改           |
| `git commit -m "说明"` | 保存一个版本           |
| `git push`             | 上传到 GitHub          |
| `git pull`             | 从 GitHub 下载最新内容 |
| `git remote -v`        | 查看连接的 GitHub 仓库 |

------

## 一句话记忆

```
Git = 本地版本管理

GitHub = 云端仓库

git add = 准备提交

git commit = 保存版本

git push = 上传 GitHub

push.bat = 一键执行 Git 同步
```