module Landable
  module Traffic
    class Medium < ActiveRecord::Base
      self.table_name = 'traffic.mediums'

      lookup_by :medium, cache: 50, find_or_create: true

      has_many :attributions
    end
  end
end