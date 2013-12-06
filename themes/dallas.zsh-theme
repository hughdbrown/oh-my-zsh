# Personalized!

# Grab the current date (%D) and time (%T) wrapped in {}: {%D %T}
DALLAS_CURRENT_TIME_="%{$fg[white]%}{%{$fg_bold[green]%}%D{%Y-%m-%d} %T%{$reset_color%}%{$fg[white]%}}%{$reset_color%}"

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '['`basename $VIRTUAL_ENV`']'
}

# Grab the current version of ruby in use (via RVM): [ruby-1.8.7]
function current_ruby {
    if [ -e ~/.rvm/bin/rvm-prompt ]; then
        ruby=$(~/.rvm/bin/rvm-prompt i v)
    elif which rbenv &> /dev/null; then
        ruby=$(rbenv version | sed -e 's/ (set.*$//')
    fi

    if [ -n $ruby ]; then
        echo "%{$fg[white]%}[%{$fg_bold[yellow]%}$ruby%{$reset_color%}%{$fg[white]%}]%{$reset_color%}"
    fi
}

# Grab the current machine name: muscato
DALLAS_CURRENT_MACH_="%{$fg_bold[green]%}%m%{$fg[white]%}:%{$reset_color%}"
# Grab the current filepath, use shortcuts: ~/Desktop
# Append the current git branch, if in a git repository: ~aw@master
DALLAS_CURRENT_LOCA_="%{$fg_bold[cyan]%}%~\$(git_prompt_info)%{$reset_color%}\$(parse_git_dirty)"
# Grab the current username: dallas
DALLAS_CURRENT_USER_="%{$fg_bold[red]%}%n%{$reset_color%}"
# Use a % for normal users and a # for privelaged (root) users.
DALLAS_PROMPT_CHAR_="%{$fg[white]%}%(!.#.%%)%{$reset_color%}"
# For the git prompt, use a white @ and blue text for the branch name
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}@%{$fg[blue]%}"
# Close it all off by resetting the color and styles.
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# Do nothing if the branch is clean (no changes).
ZSH_THEME_GIT_PROMPT_CLEAN=""
# Add 3 cyan ✗s if this branch is diiirrrty! Dirty branch!
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[cyan]%}✗✗✗"

# Put it all together!
PROMPT="$DALLAS_CURRENT_TIME_\$(current_ruby)\$(virtualenv_info)$DALLAS_CURRENT_MACH_$DALLAS_CURRENT_LOCA_ $DALLAS_CURRENT_USER_$DALLAS_PROMPT_CHAR_ "

