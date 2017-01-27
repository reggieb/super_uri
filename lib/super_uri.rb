require "super_uri/version"
require 'super_uri/file_handler'

module SuperUri
  class UnknownFormat < StandardError; end
  class UnknownAction < StandardError; end

  class << self

     def create(input, data)
      process :create, input, data
    end

    def read(input)
      process :read, input
    end

    def update(input, data)
      process :update, input, data
    end

    def delete(input)
      process :delete, input
    end

    def process(action, input, data=nil)
      raise UnknownAction unless [:create, :read, :update, :delete]
      type, path = input.split('://', 2)
      raise UnknownFormat unless handlers.keys.include?(type.to_sym)
      options = [path, data].compact
      handlers[type.to_sym].send(action, *options)
    end

    def handlers
      {
        file: FileHandler
      }
    end

  end
end
