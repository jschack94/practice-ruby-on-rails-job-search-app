class Lead < ApplicationRecord
    belongs_to :user
    belongs_to :company
  
    validates :position, presence: true
    validates :phone_number, numericality: true
  
    accepts_nested_attributes_for :company
  
      scope :search, ->(search_term) { where("position == ?", search_term) }
  
    def company_attributes=(company_attributes)
      company = Company.find_or_create_by(name: company_attributes[:name])
      company.update(company_attributes)
      self.company_id = company.id
    end
  
    OPTIONS = [
        {:name => 'Warm', :id => 1},
        {:name => 'Cold', :id => 2},
      ]
  
      def self.options
        OPTIONS.map{ |option| [option[:name], option[:id]] }
      end
  
  end