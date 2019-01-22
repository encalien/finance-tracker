class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :subscriptions
  has_many :followees, through: :subscriptions, source: :user

  def max_stocks?
    stocks.count >= 3
  end

  def full_name
    return "#{first_name} #{last_name}".strip if first_name || last_name
    "Anonymous"
  end

  def self.search(param, ignored_user)
  param.strip!
  param.downcase!
  User.where('first_name LIKE ?', "%#{param}%")
      .or(User.where('last_name LIKE ?', "%#{param}%"))
      .or(User.where('email LIKE ?', "%#{param}%"))
      .where.not(id: ignored_user.id)
  end
end
