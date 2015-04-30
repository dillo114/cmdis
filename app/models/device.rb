class Device < ActiveRecord::Base
    has_one :people

    scope :available, lambda {where(:available => true)}
    scope :sorted, lambda { order("devices.make ASC")}
end
