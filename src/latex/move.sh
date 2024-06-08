#!/bin/zsh

sudo cp -v homework.cls hwlst.sty hwsymb.sty hwcmd.sty /usr/local/texlive/texmf-local/tex/latex/local/
sudo chown -R $USER /usr/local/texlive/texmf-local/tex/latex/local/
mktexlsr
