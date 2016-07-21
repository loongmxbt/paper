defmodule Paper.Paper do
  use Paper.Web, :model

  schema "papers" do
    field :title, :string
    field :file, Exfile.Ecto.File
    belongs_to :topic, Paper.Topic
    belongs_to :user, Paper.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :file, :topic_id])
    |> validate_required([:title, :topic_id, :file])
  end
end
