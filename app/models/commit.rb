class Commit < ActiveRecord::Base
  has_many :error_lines
  validates :sha, uniqueness: true

  def to_param
    sha
  end
end
