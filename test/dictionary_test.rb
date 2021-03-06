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
    assert_equal ['.0', '00', '0.'], dictionary.letters["t"]
  end

  def test_english_to_braille_uppercase_letter
    dictionary = Dictionary.new
    assert_equal ["..0.", "....", ".0.."], dictionary.letters["A"]
    assert_equal ["...0", "..00", ".00."], dictionary.letters["T"]
  end

  def test_number_to_braille
    dictionary = Dictionary.new
    assert_equal ['00', '.0', '..'], dictionary.numbers["4"]
  end

  def test_special_character_to_braille
    dictionary = Dictionary.new
    assert_equal ['..', '00', '0.'], dictionary.special_chars["!"]
  end

  def test_multiple_lowercase_letters_to_braille
    skip
    dictionary = Dictionary.new
    assert_equal ["0.", "..", ".."], dictionary.letters["ab"]
  end

end
