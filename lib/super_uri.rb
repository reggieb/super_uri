require "super_uri/version"
require 'super_uri/file_handler'

module SuperUri
  class UnknownFormat < StandardError; end

  class << self

    def read(input)
      type, command = input.split('://', 2)
      raise UnknownFormat unless handlers.keys.include?(type.to_sym)
      handlers[type.to_sym].read(command)
    end

    def handlers
      {
        file: FileHandler
      }
    end

  end
end
