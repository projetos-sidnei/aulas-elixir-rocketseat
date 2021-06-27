defmodule WabanexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types WabanexWeb.Schema.Types.Exercise

  # Crinado as Mutations
  @desc "Logic exercise representation"
  object :training do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:exercise)
  end

  # Objeto de entrada de Dados, mutation de criação de usuário
  input_object :create_training_input do
    field :user_id, non_null(:string), description: "Training user_id"
    field :start_date, non_null(:string), description: "Training start_date"
    field :end_date, non_null(:string), description: "Training end_date"
    field :exercises, list_of(:create_exercise_input), description: "Training exercise input"
  end
end
