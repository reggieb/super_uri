require 'test_helper'

class SuperUriTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SuperUri::VERSION
  end

  def test_unknown
    assert_raises SuperUri::UnknownFormat do
      SuperUri.read('unknown://foo')
    end
  end

  def test_read_file
    content = SuperUri.read("file://#{file_path}")
    assert_equal File.read(file_path), content
  end

  def file_path
    File.expand_path('files/foo.txt', File.dirname(__FILE__))
  end
end
