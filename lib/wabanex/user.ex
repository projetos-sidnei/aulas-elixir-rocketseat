defmodule Wabanex.User do
  # Injetando os códigos do Schema do ecto na para ganhar as funções do Schema
  use Ecto.Schema
  # Importando funções do Changeset para a função
  import Ecto.Changeset

  # Configuração para gerar um id automaticamente
  @primary_key {:id, :binary_id, autogenerate: true}

  # Constante para gerar a lista de campos para utilizar em validaçõe se inserções.
  @fields [:email, :password, :name]

  # Schema User
  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  # Função para validar a inserção das informações no banco.
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
