defmodule Paper.Paper do
  use Paper.Web, :model

  schema "papers" do
    field :title, :string
    field :file, Exfile.Ecto.File
    belongs_to :topic, Paper.Topic
    belongs_to :user, Paper.User
    has_many :reviews, Paper.Review

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :file, :topic_id, :user_id])
    |> validate_required([:title, :topic_id, :file, :user_id])
  end
end
