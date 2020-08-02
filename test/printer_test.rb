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
  end

end
