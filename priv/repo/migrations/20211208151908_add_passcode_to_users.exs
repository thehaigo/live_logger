defmodule LiveLogger.Repo.Migrations.AddPasscodeToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :passcode, :string
    end
  end
end
