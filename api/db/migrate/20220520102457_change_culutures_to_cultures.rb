class ChangeCuluturesToCultures < ActiveRecord::Migration[6.1]
  def change
    rename_table :culutures, :cultures
  end
end
