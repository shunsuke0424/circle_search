class Company < ApplicationRecord
  has_one :company_athletic, dependent: :destroy
  has_one :athletic, through: :company_athletic
  has_one :company_art, dependent: :destroy
  has_one :art, through: :company_art
  has_one :company_culture, dependent: :destroy
  has_one :culture, through: :company_culture
  has_many :company_keywords, dependent: :destroy
  has_many :keyword, through: :company_keywords

  enum activity_day: {
    sunday: 'sunday',
    monday: 'monday',
    tuesday: 'tuesday',
    wednesday: 'wednesday',
    thursday: 'thursday',
    friday: 'friday',
    saturday: 'saturday'
  }
  enum company_category: { athletic: 'athletic', culture: 'culture', art: 'art' }
end
