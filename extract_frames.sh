#!/bin/bash 

#frame buffer
fb=framebuffer.pdb

#xtc file
tr=$1

#gromacs
gro=$2

#coordinate buffer
cb=$3
START=0

#frame count
END=$(($4 * 2))
#calculating half steps
#decimal places
DP="scale=2;"

#time step
TS="*0.5"

for (( i=$START; i<$END; i++ ))
do
    TIME=$(echo "$DP$i$TS" | bc)
    echo 1 | gmx trjconv -f $tr -s $gro -dump $TIME -o $fb &>/dev/null 
    #frame count
    fc=$((i+1))
    echo "frame $fc: " >> $cb
    #SER 66
    grep '14451' $fb >> $cb
    #ALA 63
    grep '14397\|14398\|14399' $fb >> $cb
    #PRO 59
    grep '14344' $fb >> $cb
    #ALA 29
    grep '13836\|13837\|13838' $fb >> $cb
    #PHE 28
    grep '13824' $fb >> $cb
    #MET 246
    grep '17266' $fb >> $cb
    #LEU 243
    grep '17218\|17219\|17220' $fb >> $cb
    #ALA 242
    grep '17199\|17200\|17201' $fb >> $cb
    #remove framebuffer
    rm $fb 
done

