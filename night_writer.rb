class NightWriter

  def initialize(input, output)
    @input = input
    @output = output
  end

  def translate_english_to_braille
    FileHandler.read_and_write_file(@input, @output)
  end

end
