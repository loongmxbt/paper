defmodule Paper.Auth do
  import Plug.Conn
  import Phoenix.Controller
  alias Paper.Router.Helpers
  alias Paper.Role
  alias Paper.Repo

  def auth_role(conn, auth_role) do
    current_user = conn.assigns.current_user
    user_role = Repo.get(Role, current_user.role_id).name
    if current_user && user_role == auth_role do
      conn
    else
      conn
      |> put_flash(:error, "You must have the right role! Current role is: " <> user_role)
      |> redirect(to: Helpers.page_path(conn, :index))
      |> halt()
    end
  end

end
