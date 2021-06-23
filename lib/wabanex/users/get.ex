defmodule Wabanex.Users.Get do
  alias Ecto.UUID
  alias Wabanex.{Repo, User}

  #Função para buscar o usuário do banco pelo UUID
  def call(id) do
    case UUID.cast(id) do
      {:ok, id} ->
        case Repo.get(User, id) do
          nil -> {:error, "User not found"}
          user -> {:ok, user}
        end
      :error ->
        {:error, "Invalid UUID"}
    end
  end


  # Opicional
  # def call(id) do
  #   id
  #   |> UUID.cast()
  #   |> handle_response()
  # end

  # defp handle_response(:error) do
  #   {:error, "Invalid UUID"}
  # end

  # defp handle_response({:ok, uuid}) do
  #   case Repo.get(User, uuid) do
  #     nil -> {:error, "User not found"}
  #     user -> {:ok, user}
  #   end
  # end
end
