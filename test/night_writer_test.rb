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

  def test_it_has_attributes
    night_writer = NightWriter.new("message.txt", "braille.txt")
    assert_equal "Created braille.txt containing 16 characters.", night_writer.translate_english_to_braille
  end

end
