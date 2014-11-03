class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :image_url
      t.string :email_address
      t.text :looking_for
      t.text :best_at
      t.string :resume_url
      t.integer :cohort_id

      t.timestamps
    end
  end
end
