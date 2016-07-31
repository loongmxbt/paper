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

    show paper do
      attributes_table do
        row :id
        row :title
        row :topic
        row :user
        # TODO exfile
      end

      panel "Reviews" do
        table_for(paper.reviews) do
          column "Status", fn(review) ->
            "#{review.status.name}"
          end
          column "Professor", fn(review) ->
            "#{review.user.name}"
          end
          column "Content", fn(review) ->
            "#{review.content}"
          end
        end
      end

    end

    query do
      %{
        all: [preload: [:topic, :user, reviews: [:status, :user]]]
      }
    end

  end
end
