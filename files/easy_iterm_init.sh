#!/bin/bash
export EIB_SCRIPT_PATH="$HOME/.easy_iterm_badge"
export EIB_CUR_SCRIPT="$EIB_SCRIPT_PATH/run_current_script"
chmod +x $EIB_SCRIPT_PATH/scripts/*
for i in `ls ~/.easy_iterm_badge/scripts`; do
  alias $i="_eib_start $i"
done

function _eib_start() {
  SHELL_NAME="$1"
  SHELL_CMD="$*"
  shift 1;
  BADGE_COMMENT=`cat $EIB_SCRIPT_PATH/scripts/$SHELL_NAME|head -2 | tail -1`
  if [[ ${BADGE_COMMENT:0:1} = "#" ]]; then
    BADGE_HEAD="${BADGE_COMMENT:1} "
  else
    BADGE_HEAD="$SHELL_NAME "
  fi
  BADGE_TEXT=$BADGE_HEAD$*
  echo "#!/bin/bash\n$EIB_SCRIPT_PATH/scripts/$SHELL_CMD\necho ========CLEAR_BADGE======='='\n" > $EIB_CUR_SCRIPT
  chmod +x $EIB_CUR_SCRIPT
  _eib_set_badge $BADGE_TEXT
  echo '========RUN_CURRENT_SCRIPT=======''='
}

function _eib_set_badge() {
  echo '
  iterm2_print_user_vars() {
    iterm2_set_user_var eibTitle "'$1'"
  }
  ' | source /dev/stdin
}
