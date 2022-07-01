class CreateCompanyKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :company_keywords do |t|
      t.references :company, null: false, foreign_key: true
      t.references :keyword
      t.timestamps
      t.index [:company_id, :keyword_id], unique: true
    end
  end
end
