class CreateVotes < ActiveRecord::Migration
  def change
    create_table   :votes do |t|
      t.references :user
      t.references :votable, polymorphic: true
    end
  end
end
