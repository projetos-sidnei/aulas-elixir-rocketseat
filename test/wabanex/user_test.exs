defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "When all params are valid, returns a valid changeset" do
      params = %{name: "Sidnei", email: "sidnei@teste.com", password: "123456"}
      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{name: "Sidnei", email: "sidnei@teste.com", password: "123456"},
        errors: []
      } = response
      end

      test "When there are invalid params, return a invalid changeset" do
        params = %{name: "S", email: "sidnei@teste.com", password: "123"}
        response = User.changeset(params)
        expected_response = %{
          name: ["shoud be at least 2 caracter(s)"],
          password: ["can't be blank"]
        }
        assert errors_on(response) == expected_response
        end
  end
end
