# mix run priv/repo/seeds.exs
alias Paper.Repo
alias Paper.User
alias Paper.Role
alias Paper.Topic

# Add Roles
Repo.delete_all Role
for role_name <- ~w(User Professor Admin) do
  Repo.insert!(%Role{name: role_name})
end

# Add topics
Repo.delete_all Topic
for topic_name <- ["基础热力学", "热力系统循环", "热泵、制冷空调", "材料热物性", "可再生能源、脱碳、储能等"] do
  Repo.insert!(%Topic{name: topic_name})
end

# Add Users
Repo.delete_all User
User.changeset(%User{}, %{name: "dragonszy", email: "dragonszy@163.com", password: "szy555", password_confirmation: "szy555", role_id: 3})
|> Repo.insert! |> User.confirm!

User.changeset(%User{}, %{name: "professor", email: "professor@163.com", password: "prof555", password_confirmation: "prof555", role_id: 2})
|> Repo.insert! |> User.confirm!

User.changeset(%User{}, %{name: "test", email: "test@163.com", password: "test555", password_confirmation: "test555", role_id: 1})
|> Repo.insert! |> User.confirm!
