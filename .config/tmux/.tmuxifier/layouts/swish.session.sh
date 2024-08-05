session_root "~/Repos/swishlist/"

if initialize_session "swish"; then
  new_window "server"
  run_cmd "source .env"
  run_cmd "iex -S mix phx.server"

  new_window "dev"
  run_cmd "source .env"
  run_cmd "nvim"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
