class CreateVotes < ActiveRecord::Migration
  def change
    create_table   :votes do |t|
      t.references :user
      t.references :votable, ploymorphic: true
    end
  end
end
