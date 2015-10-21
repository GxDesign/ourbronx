class Cause < ActiveRecord::Base
  has_many :scholarships
  has_many :donations
  def amount_funded
    self.funded/100
  end
  def goal_amount
    self.goal/100
  end
end
