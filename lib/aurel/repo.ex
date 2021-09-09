defmodule Aurel.Repo do
  use Ecto.Repo,
    otp_app: :aurel,
    adapter: Ecto.Adapters.Postgres
end
