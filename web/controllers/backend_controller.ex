defmodule Paper.BackendController do
  use Paper.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def review(conn, _params) do
    # list papers
    # list profs
    
  end

end
