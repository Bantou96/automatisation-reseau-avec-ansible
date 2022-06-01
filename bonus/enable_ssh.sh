#!/bin/bash

for i in $(cat ping_sw_ok)
do
        echo " ------------------------------ Debut   : " $i "   ---------------------------"

        expect enable_ssh.exp $i > info.txt

         echo " ------------------------------ Fin     : " $i "   ---------------------------"
done
