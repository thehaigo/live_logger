defmodule LiveLogger.Repo do
  use Ecto.Repo,
    otp_app: :live_logger,
    adapter: Ecto.Adapters.Postgres
end
