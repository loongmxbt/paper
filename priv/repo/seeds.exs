# mix run priv/repo/seeds.exs
alias Paper.Repo
alias Paper.User
alias Paper.Role
alias Paper.Topic
alias Paper.Page
alias Paper.Paper

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
|> Repo.insert! |> Coherence.ControllerHelpers.confirm!

User.changeset(%User{}, %{name: "professor", email: "professor@163.com", password: "prof555", password_confirmation: "prof555", role_id: 2})
|> Repo.insert! |> Coherence.ControllerHelpers.confirm!

User.changeset(%User{}, %{name: "phoenixfbi", email: "phoenixfbi@163.com", password: "fbi555", password_confirmation: "fbi555", role_id: 1})
|> Repo.insert! |> Coherence.ControllerHelpers.confirm!



# Add pages
Page.changeset(%Page{}, %{title: "组织结构", slug: "organization", content: "content here"})
|> Repo.insert!

Page.changeset(%Page{}, %{title: "重要日期", slug: "dates", content: "content here"})
|> Repo.insert!

Page.changeset(%Page{}, %{title: "参会注册", slug: "meeting", content: "content here"})
|> Repo.insert!

Page.changeset(%Page{}, %{title: "交通住宿", slug: "travel", content: "content here"})
|> Repo.insert!

Page.changeset(%Page{}, %{title: "会议专题", slug: "topics", content: "content here"})
|> Repo.insert!

Page.changeset(%Page{}, %{title: "特邀报告", slug: "reports", content: "content here"})
|> Repo.insert!

Page.changeset(%Page{}, %{title: "文档下载", slug: "downloads", content: "content here"})
|> Repo.insert!

Page.changeset(%Page{}, %{title: "会议日程", slug: "calendar", content: "content here"})
|> Repo.insert!

Page.changeset(%Page{}, %{title: "联系我们", slug: "contact", content: "content here"})
|> Repo.insert!


# Add Papers
Repo.delete_all Paper
Paper.changeset(%Paper{}, %{title: "热力学第一定律dragonszy", topic_id: 1, user_id: 1, file: "fileurl"})
|> Repo.insert

Paper.changeset(%Paper{}, %{title: "热力学第三定律phoenix", topic_id: 3, user_id: 3, file: "fileurl"})
|> Repo.insert
