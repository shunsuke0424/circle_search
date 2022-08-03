class Company < ApplicationRecord
  has_one :company_athletic, dependent: :destroy
  has_one :athletic, through: :company_athletic
  has_one :company_art, dependent: :destroy
  has_one :art, through: :company_art
  has_one :company_culture, dependent: :destroy
  has_one :culture, through: :company_culture
  has_many :company_keywords, dependent: :destroy
  has_many :keyword, through: :company_keywords

  scope :scope_by_user, ->(search_params) {
    company_category_filter(search_params[:company_category])
      .athletic_filter(search_params[:athletic_id])
      .culture_filter(search_params[:culture_id])
      .art_filter(search_params[:art_id])
      .search_by_keyword(search_params[:keyword])
  }
  scope :company_category_filter, ->(code) {
    case code
    when 'athletic'
      where(company_category: 'athletic')
    when 'culture'
      where(company_category: 'culture')
    when 'art'
      where(company_category: 'art')
    end
  }
  scope :athletic_filter, ->(athletic_id) {
    return if athletic_id.blank?

    scope = joins(:company_athletic)
    athletic_nil = scope.where(company_athletics: { id: nil })
    scope.merge(CompanyAthletic.where(athletic_id: athletic_id)).or(athletic_nil)
  }
  scope :culture_filter, ->(culture_id) {
    return if culture_id.blank?

    scope = joins(:company_culture)
    culture_nil = scope.where(company_cultures: { id: nil })
    scope.merge(CompanyCulture.where(culture_id: culture_id)).or(culture_nil)
  }
  scope :art_filter, ->(art_id) {
    return if art_id.blank?

    scope = joins(:company_art)
    art_nil = scope.where(company_arts: { id: nil })
    scope.merge(CompanyArt.where(art_id: art_id)).or(art_nil)
  }
  scope :search_by_keyword, ->(keyword) {
    return if keyword.blank?

    keywords = Keyword.where(content: keyword.split(/[[:space:]]/))
    company_ids = CompanyKeyword.where(keyword: keywords).pluck(:company_id)
    merge(where(id: company_ids))
      .or(where('name like ?', "%#{keyword}%"))
  }

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
