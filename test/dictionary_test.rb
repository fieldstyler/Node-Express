require "minitest/autorun"
require "minitest/pride"
require "./lib/dictionary"

class DictionaryTest < Minitest::Test

  def test_it_exists
    dictionary = Dictionary.new
    assert_instance_of Dictionary, dictionary
  end

  def test_english_to_braille_lowercase_letter
    dictionary = Dictionary.new
    assert_equal ["0.", "..", ".."], dictionary.letters["a"]
  end

  def test_number_to_braille
    dictionary = Dictionary.new
    assert_equal ['00', '.0', '..'], dictionary.numbers["4"]
  end



end
