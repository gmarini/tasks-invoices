class Task < ActiveRecord::Base
	has_many :job, :dependent => :destroy
end
