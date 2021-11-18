defmodule LiveLogger.Loggers.Map do
  use Ecto.Schema
  import Ecto.Changeset

  schema "maps" do
    field :description, :string
    field :name, :string

    belongs_to :user, LiveLogger.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(map, attrs) do
    map
    |> cast(attrs, [:name, :description, :user_id])
    |> validate_required([:name, :description, :user_id])
  end
end
