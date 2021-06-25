defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors
  alias WabanexWeb.Resolvers.User, as: UserResolver

  # Importando a macro de Usuario
  import_types WabanexWeb.Schema.Types.User

  # Salva os campos nome e email
  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.get/2
    end
  end

  # Salva o campo password
  object :root_mutation do
    field :craete_user, type: :user do
      arg :input, non_null(:create_user_input)

      resolve &UserResolver.create/2
      middleware TranslateErrors
    end
  end
end
