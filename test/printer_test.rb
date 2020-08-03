require "minitest/autorun"
require "minitest/pride"
require "./lib/dictionary"
require "./lib/printer"

class PrinterTest < Minitest::Test

  def test_it_exists
    printer = Printer.new('a')
    assert_instance_of Printer, printer
  end

  def test_can_separate_characters_in_input
    printer = Printer.new('a')
    assert_equal ['a'], printer.separate_input
    printer1 = Printer.new('ab')
    assert_equal ['a', 'b'], printer1.separate_input
  end

  def test_can_translate_letters_to_braille_given_string
    printer = Printer.new('a')
    assert_equal [['0.', '..', '..']], printer.translate_input_to_braille
    printer1 = Printer.new('ab')
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."]], printer1.translate_input_to_braille
  end

  def test_can_return_top_line
    printer1 = Printer.new('ab')
    assert_equal "0.0.", printer1.top_line
    printer2 = Printer.new('2a')
    assert_equal "0.0.", printer2.top_line
    printer3 = Printer.new('7A!')
    assert_equal "00..0...", printer3.top_line

  end

  def test_can_return_middle_line
    printer1 = Printer.new('ab')
    assert_equal "..0.", printer1.middle_line
    printer2 = Printer.new('2a')
    assert_equal "0...", printer2.middle_line
    printer3 = Printer.new('7A!')
    assert_equal "00....00", printer3.middle_line
  end

  def test_can_return_bottom_line
    printer1 = Printer.new('ab')
    assert_equal "....", printer1.bottom_line
    printer2 = Printer.new('2k')
    assert_equal "..0.", printer2.bottom_line
    printer3 = Printer.new('7A!')
    assert_equal "...0..0.", printer3.bottom_line
    assert_equal 8, printer3.bottom_line.length
  end

  def test_eighty_character_limit_per_line
    printer3 = Printer.new('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
    expected = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................"
    assert_equal expected, printer3.translate_to_braille_max_eighty_chars

    printer4 = Printer.new('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
    expected1 = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n0.\n..\n.."
    assert_equal expected1, printer4.translate_to_braille_max_eighty_chars

    printer5 = Printer.new(" !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    expected2 = "..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..\n..00..0...000...0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0.......\n..0.0...00.000....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0\n00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..\n.0...0..0...00..00..0...00......0........0...0..0...00..00..0...00......0...00..\n...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.0\n00..00..0.\n.....0...0\n00.000.000"
    assert_equal expected2, printer5.translate_to_braille_max_eighty_chars

    printer6 = Printer.new("Hello, world")
    expected3 = "..0.0.0.0.0......00.0.0.00\n..00.00.0..00...00.0000..0\n.0....0.0.0......00.0.0..."
    assert_equal expected3, printer6.translate_to_braille_max_eighty_chars
  end

end
