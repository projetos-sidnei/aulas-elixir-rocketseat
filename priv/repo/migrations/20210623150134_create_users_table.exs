defmodule Wabanex.Repo.Migrations.CreateUsersTable do
  # Injeta o código do Migration para as funções internas.
  use Ecto.Migration

  # Função
  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
