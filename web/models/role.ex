defmodule Paper.Role do
  use Paper.Web, :model

  schema "roles" do
    field :name, :string
    has_many :users, Paper.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
