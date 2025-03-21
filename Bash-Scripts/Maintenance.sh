#!/bin/bash

systemctl --failed
yay -Scc
yay -Yc
yay -Rns $(yay -Qtdq)
