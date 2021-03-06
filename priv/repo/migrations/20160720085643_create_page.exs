defmodule Paper.Repo.Migrations.CreatePage do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :title, :string
      add :slug, :string
      add :content, :text

      timestamps()
    end

  end
end
