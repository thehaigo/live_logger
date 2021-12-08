defmodule LiveLoggerWeb.UserApiSessionController do
  use LiveLoggerWeb, :controller

  alias LiveLogger.Accounts
  action_fallback LiveLoggerWeb.FallbackController

  def create(conn, %{"email" => email, "password" => password}) do
    with user when is_struct(user) <- Accounts.get_user_by_email_and_password(email, password),
         token <- user |> Accounts.generate_user_session_token() |> Base.encode64() do
      render(conn, "token.json", token: token)
    else
      _error -> {:error, :unauthorized}
    end
  end

  def refresh_token(%{assigns: %{current_user: user, token: old_token}} = conn, _params) do
    Accounts.delete_session_token(old_token)

    new_token =
      user
      |> Accounts.generate_user_session_token()
      |> Base.encode64()

    render(conn, "token.json", token: new_token)
  end
end
