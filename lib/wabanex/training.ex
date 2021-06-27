defmodule Wabanex.Training do
  # Injetando os códigos do Schema do ecto na para ganhar as funções do Schema
  use Ecto.Schema
  # Importando funções do Changeset para a função
  import Ecto.Changeset

  alias Wabanex.{Exercise, User}

  # Configuração para gerar um uuid automaticamente
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # Constante para gerar a lista de campos para utilizar em validaçõe se inserções.
  @fields [:end_date, :start_date, :user_id]

  # Schema User
  schema "trainings" do
    field :end_date, :date
    field :start_date, :date

    belongs_to :user,  User # Vai ter uma chave estrangeira
    has_many :exercises, Exercise

    timestamps()
  end

  # Função para validar a inserção das informações no banco.
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint([:email])
    |> cast_assoc(:exercises)
  end
end
