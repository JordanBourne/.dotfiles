session_root "~/.config/nvim"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "nvim-config"; then

  new_window "config"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
