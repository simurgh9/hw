#!/bin/bash

sudo cp --interactive --target-directory=/usr/local/texlive/texmf-local/tex/latex/local/ homework.cls hwlst.sty hwsymb.sty
sudo chown -R $USER /usr/local/texlive
mktexlsr
