require 'fileutils'
module SuperUri
  module FileHandler
    def self.create(command, data)
      File.write command, data
    end

    def self.read(command)
      File.read command
    end

    def self.delete(command)
      FileUtils.rm command
    end
  end
end
