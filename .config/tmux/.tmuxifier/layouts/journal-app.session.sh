session_root "~/Repos/journal-app"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "journal-app"; then
  new_window "code"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
