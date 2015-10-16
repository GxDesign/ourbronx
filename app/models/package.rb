class Package < ActiveRecord::Base
  serialize :notification_params, Hash
  def amount
    # Price will be in cents, so make sure to convert it
    self.price / 100
  end
end
