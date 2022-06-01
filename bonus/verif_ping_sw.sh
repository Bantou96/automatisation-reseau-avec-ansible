$#/bin/bash

for i in $(cat ip_list)
do
                ping -c 2 $i
                res=$(echo $?)
                echo $res

                if [[ $res == "1" ]]
                then
                        echo $i >> ping_sw_ko
                else
                        echo $i >> ping_sw_ok
                fi

done

