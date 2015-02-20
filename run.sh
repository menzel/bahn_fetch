#!/bin/bash

page=$(mktemp --suffix=".html")
echo $page

ruby bahn.rb 'Oswaldsgarten, Gießen' 'Marburg Süd' > $page
lynx $page
