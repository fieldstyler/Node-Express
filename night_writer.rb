class NightWriter

  def initialize(input, output)
    @input = input
    @output = output
  end

  def translate_english_to_braille
    FileHandler.read_and_write_file(@input, @output)
  end

end

night_writer = NightWriter.new(ARGV[0], ARGV[1])
night_writer.translate_english_to_braille
