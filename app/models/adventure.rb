class Adventure < ActiveRecord::Base
  has_many :pages
   has_many :libraries
  belongs_to :library
  accepts_nested_attributes_for :pages
  accepts_nested_attributes_for :libraries
end
