class ChangeCompanyCuluturesToCompanyCultures < ActiveRecord::Migration[6.1]
  def change
    rename_table :company_culutures, :company_cultures
  end
end
