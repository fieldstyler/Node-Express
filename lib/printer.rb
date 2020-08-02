require "./lib/dictionary"
class Printer

  def initialize(input)
    @dictionary = Dictionary.new
    @input = input
    @top = ''
    @mid = ''
    @bot = ''

  end

  def separate_input
    @input.chars
  end

  def translate_input_to_braille
    separate_input.map do |input|
      @dictionary.all_chars[input]
    end
  end

  def top_line
    translate_input_to_braille.reduce("") do |line, braille_letter|
      line << braille_letter[0]
    end
  end

  def middle_line
    translate_input_to_braille.reduce("") do |line, braille_letter|
      line << braille_letter[1]
    end
  end

  def bottom_line
    translate_input_to_braille.reduce("") do |line, braille_letter|
      line << braille_letter[2]
    end
  end

  def print_translation

  end
end
