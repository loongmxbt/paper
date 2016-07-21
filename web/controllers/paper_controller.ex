defmodule Paper.PaperController do
  use Paper.Web, :controller

  alias Paper.Topic
  alias Paper.Paper

  plug :load_topics when action in [:new, :create, :edit, :update]

  def index(conn, _params) do
    papers = Repo.all(Paper)
    render(conn, "index.html", papers: papers)
  end

  def new(conn, _params) do
    changeset = Paper.changeset(%Paper{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"paper" => paper_params}) do
    # IO.inspect paper_params
    changeset = Paper.changeset(%Paper{}, paper_params)

    case Repo.insert(changeset) do
      {:ok, _paper} ->
        conn
        |> put_flash(:info, "Paper created successfully.")
        |> redirect(to: paper_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    paper = Repo.get!(Paper, id)
    render(conn, "show.html", paper: paper)
  end

  def edit(conn, %{"id" => id}) do
    paper = Repo.get!(Paper, id)
    changeset = Paper.changeset(paper)
    render(conn, "edit.html", paper: paper, changeset: changeset)
  end

  def update(conn, %{"id" => id, "paper" => paper_params}) do
    paper = Repo.get!(Paper, id)
    changeset = Paper.changeset(paper, paper_params)

    case Repo.update(changeset) do
      {:ok, paper} ->
        conn
        |> put_flash(:info, "Paper updated successfully.")
        |> redirect(to: paper_path(conn, :show, paper))
      {:error, changeset} ->
        render(conn, "edit.html", paper: paper, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    paper = Repo.get!(Paper, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(paper)

    conn
    |> put_flash(:info, "Paper deleted successfully.")
    |> redirect(to: paper_path(conn, :index))
  end

  defp load_topics(conn, _) do
    query =
      Topic
      |> Topic.order_by_id
      |> Topic.select_names_and_ids
    topics = Repo.all query
    assign(conn, :topics, topics)
  end

end
