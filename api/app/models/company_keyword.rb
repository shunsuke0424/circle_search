class CompanyKeyword < ApplicationRecord
  belongs_to :keyword
  belongs_to :company
end
