require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./night_writer"
require "./lib/file_handler"

class NightWriterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new("message.txt", "braille.txt")
    assert_instance_of NightWriter, night_writer
  end

end
