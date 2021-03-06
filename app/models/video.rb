class Video < ApplicationRecord
  before_create :fix_url

  belongs_to :user

  private

  def fix_url
    self.url = url.gsub "watch?v=", "embed/"
  end
end
