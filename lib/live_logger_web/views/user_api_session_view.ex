defmodule LiveLoggerWeb.UserApiSessionView do
  use LiveLoggerWeb, :view

  def render("token.json", %{token: token}) do
    %{token: token}
  end
end
