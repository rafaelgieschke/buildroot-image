#!/bin/sh

SRC="$PWD"
cd ../buildroot
make BR2_EXTERNAL="$SRC" menuconfig
