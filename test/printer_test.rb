require "minitest/autorun"
require "minitest/pride"
require "./lib/dictionary"
require "./lib/printer"

class PrinterTest < Minitest::Test

  def test_it_exists
    printer = Printer.new
    assert_instance_of Printer, printer
  end

  def test_can_print_characters_in_rows
    printer = Printer.new
    
  end

end
