function logout --wraps='systemctl restart sddm || exit; loginctl kill-user $(whoami)' --description 'alias logout=systemctl restart sddm || exit; loginctl kill-user $(whoami)'
  systemctl restart sddm || exit; loginctl kill-user $(whoami) $argv
        
end
