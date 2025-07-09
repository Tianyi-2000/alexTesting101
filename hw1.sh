#!/bin/bash

# read parameters: 1st git url, 2nd local directory
GIT_URL="$1"
DIR_NAME="$2"

# two parameters
if [ -z "$1" ] || [ -z "$2" ]; then
# wrong use, show the correct one
    echo "Please check the format.
          Example: "sh ./hw1.sh git_url folder_path""
    exit 1 #???
fi

# check if the directory exist or not
if [ -d "$1" ]; then
    #echo "检测到目录 $DIR_NAME 已存在，尝试执行 git pull..."
    cd "$1" || echo "Failed to clone from $1 to $2, cant find dir"

    # 确保是一个 Git 仓库
    if [ -d ".git" ]; then
        git pull || echo "Failed to clone from $1 to $2, not .git"
    fi
    #else
    #    echo "目录 $2 不是一个 Git 仓库。"
    #    exit 1
    

else
    # 克隆仓库
    #echo "📂 目录 $1 不存在，开始克隆仓库..."
    git clone "$1" "$2" || echo "Failed to clone from $1 to $2, clone fail"
    echo "!!!!!!!!!!!!!Success: Cloned from $1 to $2"
    cd "$2" || echo "Failed to clone from $1 to $2, cant enter dir"
fi

echo "Job doneeeeeeeee！current directory is：$(pwd)!!!!!!!!!!!!!!!!"


# $GIT_URL or $1?

