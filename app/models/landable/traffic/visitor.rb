module Landable
  module Traffic
    class Visitor < ActiveRecord::Base
      include Landable::Traffic::TableName

      lookup_for :ip_address, class_name: IpAddress
      lookup_for :user_agent, class_name: UserAgent

      has_many :accesses
      has_many :visits
    end
  end
end
