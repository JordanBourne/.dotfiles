session_root "~/Repos/Learn/"

if initialize_session "learn"; then
  new_window "home"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
