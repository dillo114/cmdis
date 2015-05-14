class Device < ActiveRecord::Base
    has_one :people

    scope :available, lambda {where(:available => true)}
    scope :not_available, lambda {where(:available => false)}
    scope :sorted, lambda { order("devices.id ASC")}
end
