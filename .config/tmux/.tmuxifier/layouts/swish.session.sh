session_root "~/Repos/watchawant/web/"

if initialize_session "swish"; then
  new_window "server"
  run_cmd "npm run dev"
  split_v 50
  run_cmd "npx convex dev"

  new_window "dev"
  run_cmd "nvim ."
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
