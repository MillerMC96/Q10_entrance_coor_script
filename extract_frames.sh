#!/bin/bash 

fb=framebuffer.pdb
#xtc file
tr=$1
#coordinate buffer
cb=$2
#topology
tpr=$3
#frame count
fr=$4

for i in {0..$fr}
do
    echo 1 | gmx trjconv -f $tr -s $tpr -dump $i -o $fb &>/dev/null 
    #frame count
    fc=$((i+1))
    echo "frame $fc: " >> $cb
    #SER 66
    grep '20143' $fb >> $cb
    #ALA 63
    grep '20092\|20093\|20094' $fb >> $cb
    #PRO 59
    grep '20039' $fb >> $cb
    #ALA 29
    grep '19649\|19650\|19651' $fb >> $cb
    #PHE 28
    grep '19637' $fb >> $cb
    #MET 246
    grep '22898' $fb >> $cb
    #LEU 243
    grep '22850\|22851\|22852' $fb >> $cb
    #ALA 242
    grep '22831\|22832\|22833' $fb >> $cb
    #remove framebuffer
    rm $fb 
done

