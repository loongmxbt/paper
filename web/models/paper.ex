defmodule Paper.Paper do
  use Paper.Web, :model

  schema "papers" do
    field :title, :string
    field :file_name, :string
    field :file_url, :string
    belongs_to :topic, Paper.Topic
    belongs_to :user, Paper.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :file_name, :file_url, :topic_id])
    |> validate_required([:title, :file_name, :file_url])
  end
end
