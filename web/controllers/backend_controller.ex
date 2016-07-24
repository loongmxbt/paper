defmodule Paper.BackendController do
  use Paper.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def reviews(conn, _params) do
    render conn, "reviews.html"
    # list papers
    # list profs

  end

end
