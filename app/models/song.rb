class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released
  validate :release_future
  validates :artist_name, presence: true
  validates_uniqueness_of :release_year, scope: [:artist_name, :title]

  def release_future
    if release_year
      if release_year >= (Date.today.year + 1)
        errors.add(:release_year, "in the future")
      end
    end
  end

end
