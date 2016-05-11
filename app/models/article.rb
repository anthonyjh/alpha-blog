class Article < ActiveRecord::Base
   belongs_to :user
   
   #must add validations to make sure empty records aren't created
   validates :title, presence: true, length: { minimum: 3, maximum: 50 }
   validates :description, presence: true, length: { minimum: 10, maximum: 50 }
   validates :user_id, presence: true
   
end