#!/bin/bash

while IFS=, read name value
do
    # echo $name
    # echo $value
    # echo "sed -e \"s/\(name=\\\"${name}\\\".*\)value=\\\".*\\\"/\\\1value=\\\"${value}\"/\""
    echo "s/\(name=\\\"${name}\\\".*\)value=\\\".*\\\"/\\\1value=\\\"${value}\\\"/"
done < config.txt > config.sed

sed -f config.sed serverconfig_base.xml > serverconfig.xml
# sed -e "s/\(name=\"ServerName\".*\)value=\".*\"/\1value=\"server_name\"/" serverconfig.xml 