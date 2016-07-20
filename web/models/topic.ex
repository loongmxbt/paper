defmodule Paper.Topic do
  use Paper.Web, :model

  schema "topics" do
    field :name, :string
    has_many :papers, Paper.Paper

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

  def order_by_id(query) do
    from c in query, order_by: c.id
  end

  def select_names_and_ids(query) do
    from c in query, select: {c.name, c.id}
  end

end
