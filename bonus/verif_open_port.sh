#/bin/bash

for i in $(cat ip_list)
do
                nc -z -v -w5 $i 80 || nc -z -v -w5 $i 8080
                res=$(echo $?)
                echo $res

                if [[ $res == "0" ]]
                then
                        echo $i >> open
                else
                        echo $i >> close
                fi

done
