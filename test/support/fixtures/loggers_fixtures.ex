defmodule LiveLogger.LoggersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveLogger.Loggers` context.
  """

  @doc """
  Generate a map.
  """
  def map_fixture(attrs \\ %{}) do
    {:ok, map} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> LiveLogger.Loggers.create_map()

    map
  end
end
