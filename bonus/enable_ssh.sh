#!/bin/bash

for i in $(cat ping_ok)
do
        echo " ------------------------------ Debut   : " $i "   ---------------------------"

        expect enable_ssh.exp $i > info_ssh.txt

         echo " ------------------------------ Fin     : " $i "   ---------------------------"
done
