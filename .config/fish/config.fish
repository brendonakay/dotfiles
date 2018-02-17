set -g -x PATH /usr/local/bin $PATH
set -g -x fish_greeting ''
set fish_git_dirty_color red
set fish_git_not_dirty_color yellow

function parse_git_branch
    set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
    set -l git_diff (git diff)

   if test -n "$git_diff"
        echo (set_color $fish_git_dirty_color)$branch(set_color normal)
    else
        echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
    end
end

function fish_prompt
    set -l git_dir (git rev-parse --git-dir 2> /dev/null)
    if test -n "$git_dir"
        printf '%s@%s %s%s %s[%s%s] ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch) (set_color normal)
    else
        printf '%s@%s %s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
    end
end

alias notes="subl ~/notes/"

alias lsvms='vboxmanage list runningvms'

alias docotest='printf "\n---------------------------\n NEW TEST RUN\n---------------------------\n" >> ~/workspace/docker_dev/log/odoo.log; and docker-compose run --user odoo odoo_app --test-enable --log-level=test --stop-after-init --workers=0'

alias docmtest='docker-compose exec --user magento2 magento_web magento dev:tests:run unit'
