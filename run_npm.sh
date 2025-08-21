#!/bin/bash
# 绝对路径 Node
NODE_BIN="/home/dataiku/.local/share/fnm/node-versions/v22.18.0/installation/bin/node"

# 检查 Node 是否存在
if [ ! -x "$NODE_BIN" ]; then
    echo "Node executable not found at $NODE_BIN"
    exit 1
fi

# 检查参数
if [ $# -lt 1 ]; then
    echo "Usage: $0 <npm-command> [args...]"
    exit 1
fi

# 拼接命令
NPM_CMD="$1"
shift

# 使用 Node 执行 npm 命令，child_process.execSync 可以传递所有参数
"$NODE_BIN" -e "
const cp = require('child_process');
const args = process.argv.slice(1);
const cmd = ['npm', '$NPM_CMD', ...args];
cp.execSync(cmd.join(' '), { stdio: 'inherit' });
" "$@"
