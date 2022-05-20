json.call(
  company,
  :id,
  :name,
  :number,
  :detail,
  :place,
  :images_path,
  :frequency,
  :activity_day,
  :sns_link,
  :company_category,
)

json.athletic do
  json.partial! 'athletics/athletic', athletic: company.athletic
end
json.art do
  json.partial! 'arts/art', art: company.art
end
json.culuture do
  json.partial! 'culutures/culuture', culuture: company.culuture
end
