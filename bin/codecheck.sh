#!/bin/bash

# codecheck.sh: a simple shell script to check for binaries not
# explicitly signed by Apple
# <jonathan@zdziarski.com>
#
# usage: sudo find -x / -perm +111 -type f -exec ./codecheck.sh -d {} \;
#   remove -d flag to warn on developer certificates
#   for less noise, omit /Applications and other such paths

filename=$1
allowdevcerts=0
if [[ $filename == "-d" ]]
then
    filename=$2
    allowdevcerts=1
fi

macho=0
magic=`/usr/bin/file "$filename" 2>&1`
case "$magic" in
  *"Mach-O"*)
    macho=1
;;
esac
if [[ $macho == 0 ]]
then
    exit
fi

authinfo=`/usr/bin/codesign -d -vv "$filename" 2>&1`
valid=0

case "$authinfo" in
  *"Authority=Apple Code Signing Certification Authority"*)
    case "$authinfo" in
      *"Authority=Apple Root CA"*)
        valid=1
    ;;
    esac
  ;;
esac

if [[ $allowdevcerts == 1 ]]
then
    case "$authinfo" in
      *"Authority=Developer ID Certification Authority"*)
    case "$authinfo" in
      *"Authority=Apple Root CA"*)
        valid=1
    ;;
    esac
  ;;
  esac
fi

case "$authinfo" in
  *": code object is not signed at all"*)
      valid=-1
  ;;
esac

case "$authinfo" in
  *": bundle format unrecognized, invalid, or unsuitable"*)
      valid=-2
  ;;
esac

if [[ $valid != 1 ]]
then
#    if [[ $valid == -1 ]]
#    then
#        echo "$filename: code object is not signed at all"
#    fi

    if [[ $valid == 0 ]]
    then
        echo
        echo "$filename: invalid or non-apple code signature: $authinfo"
    fi
fi

verify=`/usr/bin/codesign -v "$filename" 2>&1`
if [[ $? != 0 ]]
then
  echo "$filename: codesign failed: $verify"
fi

