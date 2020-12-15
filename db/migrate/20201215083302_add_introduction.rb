class AddIntroduction < ActiveRecord::Migration[5.2]
  def change
    add_colum :introduction, :text
  end
end
