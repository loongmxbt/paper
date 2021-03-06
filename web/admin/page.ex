defmodule Paper.ExAdmin.Page do
  use ExAdmin.Register

  register_resource Paper.Page do
    index do
      selectable_column

      column :id
      column :title
      column :slug
      actions 
    end

    form page do
      inputs do
        input page, :title
        input page, :slug
        input page, :content, type: :text
      end
    end
  end
end
