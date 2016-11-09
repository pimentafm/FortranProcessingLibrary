#!/bin/bash

rm -rf _build && make html
cp _static/my_theme.css _build/html/_static/css/
