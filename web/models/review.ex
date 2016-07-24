defmodule Paper.Review do
  use Paper.Web, :model

  schema "reviews" do
    field :content, :string
    belongs_to :status, Paper.Status
    belongs_to :paper, Paper.Paper
    belongs_to :user, Paper.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
