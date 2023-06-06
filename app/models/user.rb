class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :clients

  def full_name
    "#{lastname}".upcase + " #{firstname}"
  end

  include PgSearch::Model
  pg_search_scope :search_all, against: [:lastname, :firstname, :email], using: { tsearch: { prefix: true } }
end
