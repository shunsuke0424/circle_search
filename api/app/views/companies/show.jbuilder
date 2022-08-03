json.company do
  json.extract! @company,
  :id, :name, :number, :detail, :place, :images_path, :frequency, :activity_day, :sns_link, :company_category
end
