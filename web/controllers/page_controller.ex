defmodule Paper.PageController do
  use Paper.Web, :controller

  alias Paper.Page

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"slug" => slug}) do
    page = Repo.get_by!(Page, slug: slug)
    render(conn, "show.html", page: page)
  end

end
