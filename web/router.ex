defmodule Paper.Router do
  use Paper.Web, :router
  use Coherence.Router
  use ExAdmin.Router

  pipeline :public do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, login: true
  end

  pipeline :auth_admin do

  end

  pipeline :backend_layout do
    plug :put_layout, {Paper.BackendView, "app.html"}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Coherence
  scope "/" do
    pipe_through :public
    coherence_routes :public
  end

  scope "/" do
    pipe_through :browser
    coherence_routes :private
  end

  # Public
  scope "/", Paper do
    pipe_through :public
    get "/", PageController, :index
    get "/page/:slug", PageController, :show
    resources "/posts", PostController, only: [:index, :show]
  end

  scope "/", Paper do
    pipe_through :browser
    resources "/papers", PaperController
  end

  # Backend
  scope "/backend", Paper do
    pipe_through [:public, :backend_layout] # protected
    get "/", BackendController, :index
    resources "/pages", PostController, except: [:index, :show]
    resources "/posts", PostController, except: [:index, :show]
  end

  scope "/backend/admin", ExAdmin do
    pipe_through [:public]
    admin_routes
  end

  # Swoosh mailbox
  if Mix.env == :dev do
    scope "/backend" do
      pipe_through [:public]
      forward "/mailbox", Plug.Swoosh.MailboxPreview, [base_path: "/backend/mailbox"]
    end
  end



end