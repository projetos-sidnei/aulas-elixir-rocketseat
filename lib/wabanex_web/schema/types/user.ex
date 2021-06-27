defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  # Crinado as Mutations
  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :trainings, list_of(:training)
  end

  # Objeto de entrada de Dados, mutation de criação de usuário
  input_object :create_user_input do
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :password, non_null(:string), description: "Users password"
  end
end
