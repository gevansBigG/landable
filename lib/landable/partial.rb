module Landable
  class Partial
    def initialize(file)
      @file = file
    end

    def process
      @name        = @file.gsub('/',' ').titlecase
      @description = "Defined in Source Code at #{@file}"
      @slug        = @file.gsub(/[^\w]/, '_')

      @processed = true
    end

    def to_template
      process unless @processed

      template                 = Template.where(file: @file).first_or_initialize
      template.body            = ''
      template.name            = @name
      template.slug            = @slug
      template.description     = @description
      template.editable        = false
      template.is_layout       = false
      template.thumbnail_url ||= "http://placehold.it/300x200"

      template.save!

      template
    end

    class << self
      def all
        files.map { |file| new(file) }
      end

      def files
        files = []

        Landable.configuration.partials_to_templates.each do |path|
          files << path
        end
      end
    end
  end
end