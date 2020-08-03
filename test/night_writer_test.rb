require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./night_writer"
require "./lib/file_handler"

class NightWriterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new("english.txt", "braille.txt")
    assert_instance_of NightWriter, night_writer
  end

  def test_it_can_create_new_file_and_print_response
    night_writer = NightWriter.new("./text_files/english.txt", "./text_files/braille.txt")
    assert_equal "Created braille.txt containing 16 characters.", night_writer.translate_to_new_file
  end

end
