class Product < ApplicationRecord
  belongs_to :client

  STATS = ["neuf", "occasion", "reconditionné"]

  include PgSearch::Model
  pg_search_scope :search_all, against: [:name, :stat], using: { tsearch: { prefix: true } }, associated_against: { client: [:username, :lastname] }
end
