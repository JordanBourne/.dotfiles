session_root "~/Repos/watchawant/web/"

if initialize_session "swish-next"; then
  new_window "server"
  run_cmd "npm run dev"
  split_h 50
  run_cmd "npm run convex"

  new_window "development"
  run_cmd "nvim"
fi

finalize_and_go_to_session
