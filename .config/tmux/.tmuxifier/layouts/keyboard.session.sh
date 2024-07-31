session_root "~/qmk_firmware/keyboards/inland/mk47/"

if initialize_session "keyboard"; then

  new_window "cli"

  new_window "config"
  run_cmd "nvim keyboards/jordanbourne/keymap.c"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
