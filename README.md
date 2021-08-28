# RGR : command line quick kata setup

RGR is a commmand utility that quickly sets up a Red Green Refactor session


Plan is : 

 - leverage 
  - Nvim
  - tmux 
  - github templates (https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/creating-a-new-repository) 
  - custom config 



## custom config 

The config file for each language (or framework) lives in 
~/.config/rgr/{{language/framework}}.rgr

E.g  ruby.rgr : 

template: 
tmuxamator:

MVP

TMUX SPLIT 


#!/bin/bash

tmux new -s work -d
tmux rename-window -t work vim
tmux send-keys -t work 'vim' C-m
tmux new-window -t work
tmux rename-window -t work server
tmux send-keys -t work './bin/rails s' C-m
tmux split-window -v -t work
tmux send-keys -t work './bin/sidekiq' C-m
tmux select-window -t work:1
tmux attach -t work







TEMPLATE FOR CODE 
TEMPLATE FOR SPEC 
RSPEC 
GAURD_RSPEC
COVERAGE FOR THAT SPEC 
NVIM 



Editors:

vim  -o code.rb code_test.rb
nvim -o code.rb code_test.rb 
emacs -nw code.rb code_test.rb 
