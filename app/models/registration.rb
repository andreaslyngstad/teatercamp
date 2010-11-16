class Registration < ActiveRecord::Base
  belongs_to :camp
  validates_presence_of :name, :age, :parent_one_name, :parent_one_phone, :billing_email, :message => "Må fylles"
  validates_format_of :billing_email, :with => /^(\S+)@(\S+)\.(\S+)$/
  validates_format_of :parent_one_phone, :with => /^[0-9]+$/
  validates_length_of :parent_one_phone, :within => 8..8, :message => "Er for kort eller langt"
  validate :camp_age
  
  def camp_age
    unless (camp.age1..camp.age2) === (age)
      errors.add :age, "Ikke rett alder. Ta kontakt"
    end
  end
end
