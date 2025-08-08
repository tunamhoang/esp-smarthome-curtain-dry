#!/usr/bin/bash

Help()
{
   # Display Help
   echo "Auto generate protobuf for Supported language of Smarthome project"
   echo
   echo "Syntax: generate [java|c|dart|all]"
   echo
   echo "java     Generate protobuf for Java"
   echo "dart     Generate protobuf for Dart"
   echo "c        Generate protobuf for C"
   echo "all      Generate for all"
}

while getopts ":h" option; do
  case $option in
    h) # display Help
      Help
      exit;;
    \?) # incorrect option
      echo "Error: Invalid option"
      exit;;
  esac
done

# ref https://stackoverflow.com/a/13196466
get_diff() {
  # $1 file extension
  # $2 HEAD~
  oldIFS="$IFS"
  IFS='
  '

  local -n __files_changed=$1

  __files_changed=( `git diff --name-only --diff-filter=ACMR $3 HEAD | grep $2` )

  IFS="$oldIFS"
}

generate_protobuf() {
  # $1 language
  # $2 version
  # $3 name
  if [ "$2"  == "c" ] && [ "$3" == "*server-main-message*" ]; then
    echo "Don't generate server-main-message for device using c language"
  elif [ "$2" != "c" ] && [ "$3" == "*client-main-message*" ]; then
    echo "client-main-message only using for c language"
  else
    mkdir -p ./build/$2/$1-out
    protoc --$1_out=./build/$2/$1-out -I ./proto/$2 $3
  fi
  if [ "$1" == "dart" ] && [ "$CI_COMMIT_REF_NAME" == "develop_v2" ]; then
    protoc --$1_out=./proto_message_dart/lib/messages -I ./proto/$2 $3
  fi
};

files_changed=
get_diff files_changed "\.proto" "HEAD~1"

if [ "$files_changed" == "" ]; then
  echo "No proto changed"
  exit 1
fi

for path in "${files_changed[@]}"
  do
    if [[ "$path" =~ "proto/".*.proto ]]; then
      version=`grep -oP '(?<=proto/)v.*(?=/.*.proto)' <<< $path`
      echo "Generate proto file: $path"
      if [ "$1" == "java" ] || [ "$1" == "dart" ] || [ "$1" == "c" ]; then
        generate_protobuf $1 $version $path
      elif [ "$1" == "all" ]; then
        generate_protobuf "java" $version $path
        generate_protobuf "dart" $version $path
        generate_protobuf "c" $version $path
      else 
        echo -e "Error: Invalid argument"
        echo 
        Help
        exit 1
      fi
    fi
done
