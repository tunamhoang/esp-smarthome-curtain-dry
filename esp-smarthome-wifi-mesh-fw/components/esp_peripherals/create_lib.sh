echo -e "Host git.nanochip.vn\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
export PATH="$PATH:/home/gitlab-runner/esp/xtensa-esp32-elf/bin"
export IDF_PATH="/home/gitlab-runner/esp/esp-idf"
PROJECT_PATH=$(pwd)
PROJECT_LIB=esp_peripherals
git config --global user.email "tuanpm@live.com"
git config --global user.name "Tuan"

create_lib()
{
  IDF_VER="release/"$1
  cd $IDF_PATH
  # workaround to fix v3.0 dont have esp_http_client
  mkdir $PROJECT_PATH/examples/esp_peripherals_app/components
  git checkout master
  cp -R $IDF_PATH/components/esp_http_client $PROJECT_PATH/examples/esp_peripherals_app/components/esp_http_client
  cp -R $IDF_PATH/components/http_server $PROJECT_PATH/examples/esp_peripherals_app/components/http_server
  # checkout correct IDF version
  git checkout $IDF_VER
  git submodule update --init --recursive -f
  git clean -f -d
  cd $PROJECT_PATH/examples/esp_peripherals_app
  export SDKCONFIG_DEFAULTS="sdkconfig_"$IDF_VER
  make defconfig
  make -j2
  rm -rf $PROJECT_PATH/examples/esp_peripherals_app/components/esp_http_client
  rm -rf $PROJECT_PATH/examples/esp_peripherals_app/components/http_server
  cd $PROJECT_PATH/..
  rm -rf $PROJECT_LIB
  git clone git@git.nanochip.vn:esp/$PROJECT_LIB.git
  cd $PROJECT_LIB
  git checkout -B $IDF_VER
  rm -rf *
  rm .gitlab-ci.yml
  cp $PROJECT_PATH/.gitignore ./
  cp $PROJECT_PATH/.editorconfig ./
  cp -R $PROJECT_PATH/include ./include
  cp $PROJECT_PATH/examples/esp_peripherals_app/build/esp_peripherals_src/libesp_peripherals_src.a ./libesp_peripherals.a
  rm -rf $PROJECT_PATH/examples/esp_peripherals_app/build
  cp -R $PROJECT_PATH/examples ./
  cp $PROJECT_PATH/component.mk.txt ./component.mk
  # cd examples/esp_peripherals_app
  # make defconfig
  # make -j2
  # cd ../../
  git add . -A
  git commit -m "Update lib $IDF_VER"
  git push origin $IDF_VER --force

}

create_lib release/v3.1
# create_lib release/v3.0
create_lib master
