class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def completed?
    if self.where(inclusion: true)
      return true
    end
  end
  
end
