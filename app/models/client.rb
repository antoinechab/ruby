class Client < ApplicationRecord
  belongs_to :user

  def full_name
    "#{lastname}".upcase + " #{username}"
  end

  include PgSearch::Model
  pg_search_scope :search_all, against: [:username, :lastname, :mail], using: { tsearch: { prefix: true } }
end
