class Request < ActiveRecord::Base
  belongs_to :wanted_gift, :foreign_key => :wanted_gift_id, class_name: 'Gift'
  belongs_to :unwanted_gift, :foreign_key => :unwanted_gift_id, class_name: 'Gift'
end
