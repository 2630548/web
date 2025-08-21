#!/bin/bash
# 绝对路径 Node 和 npm
NODE_BIN="/home/dataiku/.local/share/fnm/node-versions/v22.18.0/installation/bin/node"
NPM_BIN="/home/dataiku/.local/share/fnm/node-versions/v22.18.0/installation/bin/npm"

# 检查 Node 是否存在
if [ ! -x "$NODE_BIN" ]; then
    echo "Node executable not found at $NODE_BIN"
    exit 1
fi

# 检查 npm 是否存在
if [ ! -x "$NPM_BIN" ]; then
    echo "npm executable not found at $NPM_BIN"
    exit 1
fi

# 参数转发
CMD="$1"
shift

# 根据命令选择执行 Node 还是 npm
case "$CMD" in
    npm)
        "$NPM_BIN" "$@"
        ;;
    node)
        "$NODE_BIN" "$@"
        ;;
    *)
        echo "Usage: $0 {node|npm} [args...]"
        exit 1
        ;;
esac
