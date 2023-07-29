#!/usr/bin/bash

nvim_config_dir=".config/nvim"


function download_script() {
    cd ~/${nvim_config_dir}
    curl -s -O https://github.com/section9-lab/nvim-initializr/blob/main/README.md
}


function create_nvim_config() {
    if [ ! -d ~/${nvim_config_dir} ]; then
        echo "create nvim config dir"
        mkdir -p ~/${nvim_config_dir}
    else
        echo "~/${nvim_config_dir} exists"
    fi
}


function is_nvim_exist() {
    is_cmd_exist nvim
    if [ $? = 1 ]; then
        echo "Please install NVIM first !"
        exit
    else
        echo "nvim installed"
    fi
}

function is_cmd_exist() {
    # 0 yes | 1 not
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }
    if [ "$ret" -ne 0 ]; then
        return 1
    fi
    return 0
}

function main() {
    echo "nvim initializr.sh ...";
    is_nvim_exist
    create_nvim_config
    download_script
    echo "end"
}


main$@
