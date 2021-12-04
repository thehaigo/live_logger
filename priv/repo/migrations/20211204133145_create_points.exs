defmodule LiveLogger.Repo.Migrations.CreatePoints do
  use Ecto.Migration

  def change do
    create table(:points) do
      add :lat, :float
      add :lng, :float
      add :device_id, :string
      add :map_id, references(:maps, on_delete: :nothing)

      timestamps()
    end

    create index(:points, [:map_id])
  end
end
