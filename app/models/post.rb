class Post < ApplicationRecord
 validates :name,  :presence => true
 validates :title, :presence => true, :length => { :minimum => 5 }
 validates :content, :presence => true, :length => { :minimum => 50 }

 has_many :comments
 accepts_nested_attributes_for :comments, allow_destroy: true
end
