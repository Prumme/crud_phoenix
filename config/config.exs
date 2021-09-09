# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :aurel,
  ecto_repos: [Aurel.Repo]

# Configures the endpoint
config :aurel, AurelWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MKNw1fbIj8LfnJ8yP6OtOn1Xe+1W4BydPXdMoEn0mu/FBsplPy9AOmDHSpvOer+O",
  render_errors: [view: AurelWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Aurel.PubSub,
  live_view: [signing_salt: "KH91JyHC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
