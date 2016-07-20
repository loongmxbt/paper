defmodule Paper.Repo.Migrations.CreatePaper do
  use Ecto.Migration

  def change do
    create table(:papers) do
      add :title, :string
      add :file_name, :string
      add :file_url, :string

      timestamps()
    end

  end
end
