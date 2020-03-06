#!/bin/bash

_nvidia_array=(

packages.x86_64_nvidia 
build.sh_nvidia
run_before_squashfs.sh_nvidia
mkinitcpio.conf_nvidia
syslinux_nvidia
efiboot_nvidia
isolinux_nvidia

)

_standard_array=(

packages.x86_64_standard
build.sh_standard 
run_before_squashfs.sh_standard
mkinitcpio.conf_standard
syslinux_standard
efiboot_standard
isolinux_standard

)

echo "Type 1 for standard iso"
echo "Type 2 for nvidia iso"
read answer
if [[ $answer != 2 ]] && answer="1"
case $answer in
    1)
    for x in "${_standard_array[@]}"
    # Ugly
    do 
    rm -rf $(echo $x |sed -r 's/(.*)_.*/\1 /')
    cp -pra $x $(echo $x |sed -r 's/(.*)_.*/\1 /')
    done
    ;;
    2)
    for x in "${_nvidia_array[@]}"
    # Ugly
    do
    rm -rf $(echo $x |sed -r 's/(.*)_.*/\1 /')
    cp -pra $x $($x |sed -r 's/(.*)_.*/\1 /')
    done
    ;;

esac
    




