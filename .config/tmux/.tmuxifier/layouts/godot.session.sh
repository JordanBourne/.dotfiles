session_root "~/Godot"

if initialize_session "godot"; then

  new_window "zsh"
  split_h 10

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
