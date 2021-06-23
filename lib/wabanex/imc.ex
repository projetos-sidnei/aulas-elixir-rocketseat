defmodule Wabanex.IMC do
  # Função para ler um arquivo
  def calculate(%{"filename" => filename}) do
    filename
    |> File.read()
    |> handle_file()
  end

  # Função privada para mapear as informações no arquivo
  defp handle_file({:ok, content}) do
    data =
      content
      |> String.split(~r{[\r\n]}, trim: true)
      |> Enum.map(fn line -> parse_line(line) end)
      |> Enum.into(%{})

   {:ok, data}
  end

  # Função para retorno caso não foi possivel abrir o arquivo.
  defp handle_file({:error, _reason}) do
    {:error, "Error while opening the file"}
  end

  # Função para gerar as informações com nome e IMC
  defp parse_line(line) do
    line
    |> String.split(",")
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_imc()
  end

  # Função para calcular o IMC
  defp calculate_imc([name, height, weight]), do: {name, weight / (height * height)}
end
