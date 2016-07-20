defmodule Paper.Repo do
  use Ecto.Repo, otp_app: :paper
  use Scrivener, page_size: 10
end
