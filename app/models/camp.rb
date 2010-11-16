class Camp < ActiveRecord::Base
  has_many :registrations
  validates_presence_of :name, :description, :age1, :age2, :begin, :end
 validates_uniqueness_of :begin, :end
  
end
