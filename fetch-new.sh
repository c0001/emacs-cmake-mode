#!/usr/bin/env bash
set -e
_source_name="${BASH_SOURCE[0]}"
while [ -h "$_source_name" ]; do # resolve $_source_name until the file is no longer a symlink
    _dir_name="$( cd -P "$( dirname "$_source_name" )" >/dev/null && pwd )"
    _source_name="$(readlink "$_source_name")"

    # if $_source_name was a relative symlink, we need to resolve it relative
    # to the path where the symlink file was located
    [[ $_source_name != /* ]] && _source_name="$_dir_name/$_source_name"
done
_dir_name="$( cd -P "$( dirname "$_source_name" )" >/dev/null && pwd )"
_current_dir_name="$(pwd)"

url='https://gitlab.kitware.com/cmake/cmake/-/raw/master/Auxiliary/cmake-mode.el'
elisp_file="${_dir_name}/cmake-mode.el"
rm "$elisp_file"
curl -sL "$url" -o "$elisp_file"
