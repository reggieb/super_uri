require 'test_helper'

class SuperUriTest < Minitest::Test

  def teardown
    FileUtils.rm new_file if File.exist?(new_file)
  end

  def test_that_it_has_a_version_number
    refute_nil ::SuperUri::VERSION
  end

  def test_unknown
    assert_raises SuperUri::UnknownFormat do
      SuperUri.read('unknown://foo')
    end
  end

  def test_create_file
    content = 'Something'
    SuperUri.create "file://#{new_file}", content
    assert_equal content, File.read(new_file)
  end

  def test_read_file
    content = SuperUri.read("file://#{file_path}")
    assert_equal File.read(file_path), content
  end

  def test_delete_file
    test_create_file
    SuperUri.delete "file://#{new_file}"
    assert_equal false, File.exist?(new_file)
  end

  def file_path
    local_path 'foo.txt'
  end

  def local_path(name)
    File.expand_path(File.join('files', name), File.dirname(__FILE__))
  end

  def new_file
    local_path 'new.txt'
  end
end
