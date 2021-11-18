defmodule LiveLoggerWeb.MapLive.Index do
  use LiveLoggerWeb, :live_view

  alias LiveLogger.Loggers
  alias LiveLogger.Loggers.Map

  @impl true
  def mount(_params, %{"user_id" => user_id}, socket) do
    {
      :ok,
      socket
      |> assign(:maps, list_maps())
      |> assign(:user_id, user_id)
    }
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Map")
    |> assign(:map, Loggers.get_map!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Map")
    |> assign(:map, %Map{user_id: socket.assigns.user_id})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Maps")
    |> assign(:map, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    map = Loggers.get_map!(id)
    {:ok, _} = Loggers.delete_map(map)

    {:noreply, assign(socket, :maps, list_maps())}
  end

  defp list_maps do
    Loggers.list_maps()
  end
end
