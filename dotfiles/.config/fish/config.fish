set -gx COLORTERM '24bit'

alias vim="nvim"

if status is-interactive 
  set -gx EDITOR 'nvim'
  set -gx VISUAL 'nvim'
end

if type -q go
  set -U fish_user_paths $HOME/bin (go env GOPATH)/bin
else
  set -U fish_user_paths $HOME/bin
end

fish_vi_key_bindings
