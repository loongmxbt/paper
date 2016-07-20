# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :paper,
  ecto_repos: [Paper.Repo]

# Configures the endpoint
config :paper, Paper.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iSFyDU3LoIfp8H7YQVexXpSFZTOYuGSXC6OWMlr0u2em1jLENz+ya3TD/gEZzNyj",
  render_errors: [view: Paper.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Paper.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Paper.User,
  repo: Paper.Repo,
  module: Paper,
  logged_out_url: "/",
  email_from: {"工程热物理", "admin@thermodynamics.cn"},
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :confirmable, :registerable]

# config :coherence, Paper.Coherence.Mailer,
#   adapter: Swoosh.Adapters.Mailgun,
#   api_key: "my-api-key",
#   domain: "avengers.com"

# %% End Coherence Configuration %%

# Gettext i18n
config :paper, Paper.Gettext, default_locale: "zh"

config :xain, :after_callback, {Phoenix.HTML, :raw}

# ExAdmin
config :ex_admin,
  repo: Paper.Repo,
  module: Paper,
  head_template: {Paper.AdminView, "admin_layout.html"},
  modules: [
    Paper.ExAdmin.Dashboard,
    Paper.ExAdmin.Post,
    Paper.ExAdmin.User,
    Paper.ExAdmin.Role,
    Paper.ExAdmin.Topic,
    Paper.ExAdmin.Paper,
    Paper.ExAdmin.Page
  ]
