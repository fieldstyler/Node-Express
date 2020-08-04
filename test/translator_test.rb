require "minitest/autorun"
require "minitest/pride"
require "./lib/dictionary"
require "./lib/translator"

class TranslatorTest < Minitest::Test

  def test_it_exists
    translator = Translator.new('a')
    assert_instance_of Translator, translator
  end

  def test_can_separate_characters_in_input
    translator = Translator.new('a')
    assert_equal ['a'], translator.separate_english_characters
    translator1 = Translator.new('ab')
    assert_equal ['a', 'b'], translator1.separate_english_characters
  end

  def test_can_translate_letters_to_braille_given_string
    translator = Translator.new('a')
    assert_equal [['0.', '..', '..']], translator.translate_english_to_braille
    translator1 = Translator.new('ab')
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."]], translator1.translate_english_to_braille
  end

  def test_can_return_top_line
    translator1 = Translator.new('ab')
    assert_equal "0.0.", translator1.top_line
    translator2 = Translator.new('FoSho!')
    assert_equal "..000....00.0...", translator2.top_line
  end

  def test_can_return_middle_line
    translator1 = Translator.new('ab')
    assert_equal "..0.", translator1.middle_line
    translator2 = Translator.new('FoSho!')
    assert_equal "..0..0..0.00.000", translator2.middle_line
  end

  def test_can_return_bottom_line
    translator1 = Translator.new('ab')
    assert_equal "....", translator1.bottom_line
    translator2 = Translator.new('FoSho!')
    assert_equal ".0..0..00...0.0.", translator2.bottom_line
    assert_equal 16, translator2.bottom_line.length
  end

  def test_eighty_character_limit_per_line
    translator3 = Translator.new('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
    expected = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................"
    assert_equal expected, translator3.translate_to_braille_max_eighty_chars

    translator4 = Translator.new('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
    expected1 = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n0.\n..\n.."
    assert_equal expected1, translator4.translate_to_braille_max_eighty_chars

    translator5 = Translator.new(" !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    expected2 = "..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..\n..00..0...000...0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0.......\n..0.0...00.000....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0\n00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..\n.0...0..0...00..00..0...00......0........0...0..0...00..00..0...00......0...00..\n...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.0\n00..00..0.\n.....0...0\n00.000.000"
    assert_equal expected2, translator5.translate_to_braille_max_eighty_chars

    translator6 = Translator.new("Hello, world")
    expected3 = "..0.0.0.0.0......00.0.0.00\n..00.00.0..00...00.0000..0\n.0....0.0.0......00.0.0..."
    assert_equal expected3, translator6.translate_to_braille_max_eighty_chars
  end

  def test_can_translate_braille_to_english
    translator = Translator.new("0.0.\n..0.\n....")
    assert_equal 'ab', translator.translate_braille_to_english
  end

  def test_can_turn_rows_into_braille_characters
    translator = Translator.new("0.0.\n..0.\n....")
      expected = [['0.', '..', '..'], ['0.', '0.', '..']]
      assert_equal expected, translator.separate_braille
  end

end
