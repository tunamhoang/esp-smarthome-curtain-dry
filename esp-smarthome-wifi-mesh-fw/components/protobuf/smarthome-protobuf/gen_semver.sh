#!/bin/bash

#get highest tag number
NEW_VERSION=`echo "${TAG_VERSION}" | head -1 | sed 's/ //g'` # get first line and trim space
NEW_VERSION=${NEW_VERSION/"[tag]"} # remove format pattern

if [[ ! "${NEW_VERSION}" =~ ^([0-9\+\.)?([0-9]+\.)?(\*|[0-9]+)$ ]]; then
  OLD_VERSION=`git tag | tail -1`

  #replace . with space so can split into an array
  VERSION_BITS=(${OLD_VERSION//./ })

  #get number parts and increase last one by 1
  VNUM1=${VERSION_BITS[0]}
  VNUM2=${VERSION_BITS[1]}
  VNUM3=${VERSION_BITS[2]}
  VNUM3=$((VNUM3+1))

  #create new tag
  NEW_VERSION="$VNUM1.$VNUM2.$VNUM3"
fi

echo "$NEW_VERSION"
