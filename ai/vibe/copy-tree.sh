#!/bin/bash
TARGET_DIR=${1:-.}

find "$TARGET_DIR" -print | sed -e 's;[^/]*/;│   ;g' -e 's;│   \([^│]\);├── \1;' | pbcopy

echo "폴더 구조가 클립보드에 복사되었음!"
