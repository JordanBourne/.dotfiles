session_root "~/Repos/Squarespace/WillowHome"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "willow"; then

  new_window "run"
  new_window "terminal"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
