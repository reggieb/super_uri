require 'fileutils'
module SuperUri
  module FileHandler
    def self.create(path, data)
      File.write path, data
    end

    def self.read(path)
      File.read path
    end

    def self.update(path, data)
      create path, data
    end

    def self.delete(path)
      FileUtils.rm path
    end
  end
end
