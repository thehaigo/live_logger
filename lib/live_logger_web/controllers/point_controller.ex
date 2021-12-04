defmodule LiveLoggerWeb.PointController do
  use LiveLoggerWeb, :controller

  alias LiveLogger.Loggers
  alias LiveLogger.Loggers.Point

  action_fallback LiveLoggerWeb.FallbackController

  def create(conn, point_params) do
    with {:ok, %Point{}} <- Loggers.create_point(point_params) do
      send_resp(conn, 200, "ok")
    end
  end
end
