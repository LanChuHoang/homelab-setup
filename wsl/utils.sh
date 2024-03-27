#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

log_error() {
  echo -e "${RED}[$(date +"%Y-%m-%d %H:%M:%S")] [ERROR]: $1${NC}"
}

log_warn() {
  echo -e "${YELLOW}[$(date +"%Y-%m-%d %H:%M:%S")] [WARN]: $1${NC}"
}

log_info() {
  echo -e "${GREEN}[$(date +"%Y-%m-%d %H:%M:%S")] [INFO]: $1${NC}"
}
