class NewsArticle < ApplicationRecord
    before_save :title => :title.to_s.titleize
    after_create :published_at => Date.today

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
    # validate :compare_dates

    private

    # def compare_dates
    #     if published_at < created_at
    #         errors.add(:published_at, "must have a publish date after created date")
    #     end
    # end

end