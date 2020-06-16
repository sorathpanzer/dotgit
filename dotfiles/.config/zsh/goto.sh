# shellcheck shell=bash
# shellcheck disable=SC2039
# MIT License
#
# Copyright (c) 2018 Lazarus Lazaridis
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Changes to the given alias directory
# or executes a command based on the arguments.
go()
{
  local target
  _go_resolve_db

  if [ -z "$1" ]; then
    # display usage and exit when no args
    _go_usage
    return
  fi

  subcommand="$1"
  shift
  case "$subcommand" in
    -c|--cleanup)
      _go_cleanup "$@"
      ;;
    -r|--register) # Register an alias
      _go_register_alias "$@"
      ;;
    -u|--unregister) # Unregister an alias
      _go_unregister_alias "$@"
      ;;
    -p|--push) # Push the current directory onto the pushd stack, then go
      _go_directory_push "$@"
      ;;
    -o|--pop) # Pop the top directory off of the pushd stack, then change that directory
      _go_directory_pop
      ;;
    -l|--list)
      _go_list_aliases
      ;;
    -x|--expand) # Expand an alias
      _go_expand_alias "$@"
      ;;
    -h|--help)
      _go_usage
      ;;
    -v|--version)
      _go_version
      ;;
    *)
      _go_directory "$subcommand"
      ;;
  esac
  return $?
}

_go_resolve_db()
{
  go_DB="${go_DB:-$HOME/.go}"
  touch -a "$go_DB"
}

_go_usage()
{
  cat <<\USAGE
usage: go [<option>] <alias> [<directory>]
default usage:
  go <alias> - changes to the directory registered for the given alias
OPTIONS:
  -r, --register: registers an alias
    go -r|--register <alias> <directory>
  -u, --unregister: unregisters an alias
    go -u|--unregister <alias>
  -p, --push: pushes the current directory onto the stack, then performs go
    go -p|--push <alias>
  -o, --pop: pops the top directory from the stack, then changes to that directory
    go -o|--pop
  -l, --list: lists aliases
    go -l|--list
  -x, --expand: expands an alias
    go -x|--expand <alias>
  -c, --cleanup: cleans up non existent directory aliases
    go -c|--cleanup
  -h, --help: prints this help
    go -h|--help
  -v, --version: displays the version of the go script
    go -v|--version
USAGE
}

# Displays version
_go_version()
{
  echo "go version 1.2.4.1"
}

# Expands directory.
# Helpful for ~, ., .. paths
_go_expand_directory()
{
  builtin cd "$1" 2>/dev/null && pwd
}

# Lists registered aliases.
_go_list_aliases()
{
  local IFS=$' '
  if [ -f "$go_DB" ]; then
    while read -r name directory; do
      printf '\e[1;36m%20s  \e[0m%s\n' "$name" "$directory"
    done < "$go_DB"
  else
    echo "You haven't configured any directory aliases yet."
  fi
}

# Expands a registered alias.
_go_expand_alias()
{
  if [ "$#" -ne "1" ]; then
    _go_error "usage: go -x|--expand <alias>"
    return
  fi

  local resolved

  resolved=$(_go_find_alias_directory "$1")
  if [ -z "$resolved" ]; then
    _go_error "alias '$1' does not exist"
    return
  fi

  echo "$resolved"
}

# Lists duplicate directory aliases
_go_find_duplicate()
{
  local duplicates=

  duplicates=$(sed -n 's:[^ ]* '"$1"'$:&:p' "$go_DB" 2>/dev/null)
  echo "$duplicates"
}

# Registers and alias.
_go_register_alias()
{
  if [ "$#" -ne "2" ]; then
    _go_error "usage: go -r|--register <alias> <directory>"
    return 1
  fi

  if ! [[ $1 =~ ^[[:alnum:]]+[a-zA-Z0-9_-]*$ ]]; then
    _go_error "invalid alias - can start with letters or digits followed by letters, digits, hyphens or underscores"
    return 1
  fi

  local resolved
  resolved=$(_go_find_alias_directory "$1")

  if [ -n "$resolved" ]; then
    _go_error "alias '$1' exists"
    return 1
  fi

  local directory
  directory=$(_go_expand_directory "$2")
  if [ -z "$directory" ]; then
    _go_error "failed to register '$1' to '$2' - can't cd to directory"
    return 1
  fi

  local duplicate
  duplicate=$(_go_find_duplicate "$directory")
  if [ -n "$duplicate" ]; then
    _go_warning "duplicate alias(es) found: \\n$duplicate"
  fi

  # Append entry to file.
  echo "$1 $directory" >> "$go_DB"
  echo "Alias '$1' registered successfully."
}

# Unregisters the given alias.
_go_unregister_alias()
{
  if [ "$#" -ne "1" ]; then
    _go_error "usage: go -u|--unregister <alias>"
    return 1
  fi

  local resolved
  resolved=$(_go_find_alias_directory "$1")
  if [ -z "$resolved" ]; then
    _go_error "alias '$1' does not exist"
    return 1
  fi

  # shellcheck disable=SC2034
  local readonly go_DB_TMP="$HOME/.go_"
  # Delete entry from file.
  sed "/^$1 /d" "$go_DB" > "$go_DB_TMP" && mv "$go_DB_TMP" "$go_DB"
  echo "Alias '$1' unregistered successfully."
}

# Pushes the current directory onto the stack, then go
_go_directory_push()
{
  if [ "$#" -ne "1" ]; then
    _go_error "usage: go -p|--push <alias>"
    return
  fi

  { pushd . || return; } 1>/dev/null 2>&1

  _go_directory "$@"
}

# Pops the top directory from the stack, then go
_go_directory_pop()
{
  { popd || return; } 1>/dev/null 2>&1
}

# Unregisters aliases whose directories no longer exist.
_go_cleanup()
{
  if ! [ -f "$go_DB" ]; then
    return
  fi

  while IFS= read -r i && [ -n "$i" ]; do
    echo "Cleaning up: $i"
    _go_unregister_alias "$i"
  done <<< "$(awk '{al=$1; $1=""; dir=substr($0,2);
                    system("[ ! -d \"" dir "\" ] && echo " al)}' "$go_DB")"
}

# Changes to the given alias' directory
_go_directory()
{
  local target

  target=$(_go_resolve_alias "$1") || return 1

  builtin cd "$target" 2> /dev/null || \
    { _go_error "Failed to go '$target'" && return 1; }
}

# Fetches the alias directory.
_go_find_alias_directory()
{
  local resolved

  resolved=$(sed -n "s/^$1 \\(.*\\)/\\1/p" "$go_DB" 2>/dev/null)
  echo "$resolved"
}

# Displays the given error.
# Used for common error output.
_go_error()
{
  (>&2 echo -e "go error: $1")
}

# Displays the given warning.
# Used for common warning output.
_go_warning()
{
  (>&2 echo -e "go warning: $1")
}

# Displays entries with aliases starting as the given one.
_go_print_similar()
{
  local similar

  similar=$(sed -n "/^$1[^ ]* .*/p" "$go_DB" 2>/dev/null)
  if [ -n "$similar" ]; then
    (>&2 echo "Did you mean:")
    (>&2 column -t <<< "$similar")
  fi
}

# Fetches alias directory, errors if it doesn't exist.
_go_resolve_alias()
{
  local resolved

  resolved=$(_go_find_alias_directory "$1")

  if [ -z "$resolved" ]; then
    _go_error "unregistered alias $1"
    _go_print_similar "$1"
    return 1
  else
    echo "${resolved}"
  fi
}

# Completes the go function with the available commands
_complete_go_commands()
{
  local IFS=$' \t\n'

  # shellcheck disable=SC2207
  COMPREPLY=($(compgen -W "-r --register -u --unregister -p --push -o --pop -l --list -x --expand -c --cleanup -v --version" -- "$1"))
}

# Completes the go function with the available aliases
_complete_go_aliases()
{
  local IFS=$'\n' matches
  _go_resolve_db

  # shellcheck disable=SC2207
  matches=($(sed -n "/^$1/p" "$go_DB" 2>/dev/null))

  if [ "${#matches[@]}" -eq "1" ]; then
    # remove the filenames attribute from the completion method
    compopt +o filenames 2>/dev/null

    # if you find only one alias don't append the directory
    COMPREPLY=("${matches[0]// *}")
  else
    for i in "${!matches[@]}"; do
      # remove the filenames attribute from the completion method
      compopt +o filenames 2>/dev/null

      if ! [[ $(uname -s) =~ Darwin* ]]; then
        matches[$i]=$(printf '%*s' "-$COLUMNS" "${matches[$i]}")

        COMPREPLY+=("$(compgen -W "${matches[$i]}")")
      else
        COMPREPLY+=("${matches[$i]// */}")
      fi
    done
  fi
}

# Bash programmable completion for the go function
_complete_go_bash()
{
  local cur="${COMP_WORDS[$COMP_CWORD]}" prev

  if [ "$COMP_CWORD" -eq "1" ]; then
    # if we are on the first argument
    if [[ $cur == -* ]]; then
      # and starts like a command, prompt commands
      _complete_go_commands "$cur"
    else
      # and doesn't start as a command, prompt aliases
      _complete_go_aliases "$cur"
    fi
  elif [ "$COMP_CWORD" -eq "2" ]; then
    # if we are on the second argument
    prev="${COMP_WORDS[1]}"

    if [[ $prev = "-u" ]] || [[ $prev = "--unregister" ]]; then
      # prompt with aliases if user tries to unregister one
      _complete_go_aliases "$cur"
    elif [[ $prev = "-x" ]] || [[ $prev = "--expand" ]]; then
      # prompt with aliases if user tries to expand one
      _complete_go_aliases "$cur"
    elif [[ $prev = "-p" ]] || [[ $prev = "--push" ]]; then
      # prompt with aliases only if user tries to push
      _complete_go_aliases "$cur"
    fi
  elif [ "$COMP_CWORD" -eq "3" ]; then
    # if we are on the third argument
    prev="${COMP_WORDS[1]}"

    if [[ $prev = "-r" ]] || [[ $prev = "--register" ]]; then
      # prompt with directories only if user tries to register an alias
      local IFS=$' \t\n'

      # shellcheck disable=SC2207
      COMPREPLY=($(compgen -d -- "$cur"))
    fi
  fi
}

# Zsh programmable completion for the go function
_complete_go_zsh()
{
  local all_aliases=()
  while IFS= read -r line; do
    all_aliases+=("$line")
  done <<< "$(sed -e 's/ /:/g' ~/.go 2>/dev/null)"

  local state
  local -a options=(
    '(1)'{-r,--register}'[registers an alias]:register:->register'
    '(- 1 2)'{-u,--unregister}'[unregisters an alias]:unregister:->unregister'
    '(: -)'{-l,--list}'[lists aliases]'
    '(*)'{-c,--cleanup}'[cleans up non existent directory aliases]'
    '(1 2)'{-x,--expand}'[expands an alias]:expand:->aliases'
    '(1 2)'{-p,--push}'[pushes the current directory onto the stack, then performs go]:push:->aliases'
    '(*)'{-o,--pop}'[pops the top directory from stack, then changes to that directory]'
    '(: -)'{-h,--help}'[prints this help]'
    '(* -)'{-v,--version}'[displays the version of the go script]'
  )

  _arguments -C \
    "${options[@]}" \
    '1:alias:->aliases' \
    '2:dir:_files' \
  && ret=0

  case ${state} in
    (aliases)
      _describe -t aliases 'go aliases:' all_aliases && ret=0
    ;;
    (unregister)
      _describe -t aliases 'unregister alias:' all_aliases && ret=0
    ;;
  esac
  return $ret
}

go_aliases=($(alias | sed -n "s/.*\s\(.*\)='go'/\1/p"))
go_aliases+=("go")

for i in "${go_aliases[@]}"
	do
		# Register the go completions.
	if [ -n "${BASH_VERSION}" ]; then
	  if ! [[ $(uname -s) =~ Darwin* ]]; then
	    complete -o filenames -F _complete_go_bash $i
	  else
	    complete -F _complete_go_bash $i
	  fi
	elif [ -n "${ZSH_VERSION}" ]; then
	  compdef _complete_go_zsh $i
	else
	  echo "Unsupported shell."
	  exit 1
	fi
done
