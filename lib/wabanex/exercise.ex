defmodule Wabanex.Exercise do
  # Injetando os códigos do Schema do ecto na para ganhar as funções do Schema
  use Ecto.Schema
  # Importando funções do Changeset para a função
  import Ecto.Changeset

  alias Wabanex.Training

  # Configuração para gerar um id automaticamente
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # Constante para gerar a lista de campos para utilizar em validaçõe se inserções.
  @fields [:name, :protocol_description, :repetitions, :youtube_video_url]

  # Schema User
  schema "exercises" do
    field :name, :string
    field :protocol_description, :string
    field :repetitions, :string
    field :youtube_video_url, :string

    belongs_to :training, Training

    timestamps()
  end

  # Função para validar a inserção das informações no banco.
  def changeset(exercise, params) do
    exercise
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
