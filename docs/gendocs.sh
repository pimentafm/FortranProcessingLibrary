#!/bin/bash

rm -rf _build && make html
cp _static/my_theme.css _build/html/_static/css/
cp src/logo_grupo_en_verde.png _build/html/src/
