defmodule Wabanex.IMC do
  def calculate(filename) do
    filename
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, content}) do
    content
    |> String.split('\n')
    |> Enum.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.split(',')
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/2)
  end

  defp handle_file({:error, reason}) do
    {:error, "Error while opening the file"}
  end
end
