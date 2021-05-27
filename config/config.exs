# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :zaryn,
  ecto_repos: [Zaryn.Repo]

# Configures the endpoint
config :zaryn, ZarynWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qwnfgasK6c/s17iPHptox1ms0JcO77Imk6YYONPQi7LDEm8s3c5yyQ+rbnmtH/jT",
  render_errors: [view: ZarynWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Zaryn.PubSub,
  live_view: [signing_salt: "THvNvVba"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
