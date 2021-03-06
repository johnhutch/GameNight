class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, :polymorphic => true
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment :image, :presence => true,
    :size => { :in => 1..5000.kilobytes }
end
