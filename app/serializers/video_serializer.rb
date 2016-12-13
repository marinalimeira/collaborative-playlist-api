class VideoSerializer < ActiveModel::Serializer
  attributes :id, :url, :date
  has_one :user

  def date
    object.created_at.strftime "em %d/%m/%Y - %H:%M"
  end
end
