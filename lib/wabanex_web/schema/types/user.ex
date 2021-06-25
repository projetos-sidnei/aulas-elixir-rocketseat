defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  # Usando macro para importar um modulo (tipo) customizado
  import_types WabanexWeb.Schema.Types.Custom.UUID4

  # Crinado as Mutations
  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end

  # Objeto de entrada de Dados, mutation de criação de usuário
  input_object :create_user_input do
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :password, non_null(:string), description: "Users password"
  end
end
