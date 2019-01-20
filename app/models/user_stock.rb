class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :stock_id, uniqueness: { scope: :user_id, message: "has already been added." }
  validate :user_over_stock_limit?

  def user_over_stock_limit?
    if user.stocks.count >= 3
      errors.add(:user, "has reached stock limit.")
    end
  end
end
