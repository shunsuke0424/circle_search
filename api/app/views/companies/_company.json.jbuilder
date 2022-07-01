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
  :company_category
)

json.athletic do
  json.partial! 'athletics/athletic', athletic: company.athletic
end
json.art do
  json.partial! 'arts/art', art: company.art
end
json.culture do
  json.partial! 'cultures/culture', culture: company.culture
end
json.keyword do
  json.partial! 'keywords/keyword', keyword: company.keyword
end
