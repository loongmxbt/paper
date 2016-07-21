defmodule Paper.ExAdmin.Paper do
  use ExAdmin.Register

  register_resource Paper.Paper do
    index do
      selectable_column

      column :id
      column :title
      column :topic
      column :user, fields: [:name]
      actions
    end
  end
end
