class Person < ActiveRecord::Base

    has_many :device

    scope :available, lambda {where(:available => true)}
    scope :sorted, lambda { order("people.last_name ASC")}
end
