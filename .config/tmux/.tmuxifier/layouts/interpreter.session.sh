session_root "~/Repos/Learning/interpreter"

if initialize_session "interpreter"; then

  new_window "console"

  new_window "implementation"
  run_cmd "cd rust-impl"
  split_h 50
  run_cmd "cd go-impl"


fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
