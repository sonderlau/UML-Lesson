#!/bin/bash
$base_dir $ cd "$(dirname "$0")";pwd)

sudo java -jar plantuml.jar ./src/**.wsd $base_dir/out/ -svg -charset UTF-8