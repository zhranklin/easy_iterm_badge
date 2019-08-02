function install_main() {
  cd $HOME
  for fn in .zshrc .bashrc; do
    if [ -f $fn ];then
      if [ `grep -c "easy_iterm" $fn` -eq '0' ]; then
        echo 'source $HOME/.easy_iterm_badge/easy_iterm_init.sh' >> $fn
      fi
    fi
  done
  mkdir -p .easy_iterm_badge/scripts
  cd $HOME/.easy_iterm_badge
  URL_BASE='https://raw.githubusercontent.com/zhranklin/easy_iterm_badge/master/files'
  for fn in easy_iterm_init.sh scripts/ei_test scripts/ssh; do
    curl -fsSL $URL_BASE/$fn > $fn
    echo $URL_BASE/$fn
  done
}
(install_main)
echo successfully installed easy_iterm_badge, please restart your shell!
