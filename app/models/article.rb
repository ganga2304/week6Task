class Article < ApplicationRecord
    belongs_to :user
    validates :title,presence: true, length: {minimum:2,maximum: 100}
    validates :description,presence: true,length: {minimum:2,maximum:600}
end