require "./lib/file_handler"
require "./lib/printer"
class NightWriter
  include FileHandler

  def initialize(input, output)
    @input = input
    @output = output
  end

  def write_to_new_file
    FileHandler.read_and_write_file(@input, @output)
  end

  def translate_to_new_file
    FileHandler.read_and_translate_file(@input, @output)
  end

end

night_writer = NightWriter.new(ARGV[0], ARGV[1])
night_writer.translate_to_new_file
