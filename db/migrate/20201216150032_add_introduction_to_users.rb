class AddIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :text
  end
  validates :introduction, presence: true, length:{ maximum: 50 }

end
