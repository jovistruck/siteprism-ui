#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
COMMON_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/common/" && pwd )"

pushd "$DIR" >/dev/null 2>&1

"$COMMON_DIR/ruby.sh" 2.3.1 2.4.0 >/dev/null

bundle check || bundle install --path vendor/bundle

#headless
bundle exec cucumber -p valtech-live

#Chrome
#bundle exec cucumber -p which-live -p browser_chrome
#Firefox
# 		bundle exec cucumber -p which-live
