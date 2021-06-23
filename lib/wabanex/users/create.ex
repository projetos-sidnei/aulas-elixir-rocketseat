defmodule Wabanex.Users.Create do
  alias Wabanex.{Repo, User}

  # Insere o usuário no banco de dados
  def call(params) do
    params
    |> User.changeset() # Chama a função changeset que está no arquivo user.ex
    |> Repo.insert()    # Utiliza o Wabanex.Repo do ecto para inserção.
  end
end
