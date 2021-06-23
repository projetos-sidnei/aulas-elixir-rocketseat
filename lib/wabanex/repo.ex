defmodule Wabanex.Repo do
  # Modulo de coneção do ecto para o Postgres
  use Ecto.Repo,
    otp_app: :wabanex,
    adapter: Ecto.Adapters.Postgres
end
