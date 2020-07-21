class Item < ApplicationRecord
  belongs_to :list

  def complete?
    self.status == 1
  end

  def incomplete?
    self.status == 0
  end

end
