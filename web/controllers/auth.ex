defmodule Paper.Auth do
  import Plug.Conn
  import Phoenix.Controller
  alias Paper.Router.Helpers

  def auth_role(conn, role) do
    current_user = conn.assigns.current_user
    if current_user && current_user.role == role do
      conn
    else
      conn
      |> put_flash(:error, "You must have the right role!")
      |> redirect(to: Helpers.page_path(conn, :index))
      |> halt()
    end
  end

end
