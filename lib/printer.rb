require "./lib/dictionary"
class Printer

  def initialize(input)
    @dictionary = Dictionary.new
    @input = input
    @output = []
  end

  def separate_input
    @input.chars
  end

  def translate_input_to_braille
    separate_input.map do |input|
      @dictionary.english_to_braille[input]
    end
  end

  def top_line
    translate_input_to_braille.reduce("") do |line, braille_character|
      line << braille_character[0]
    end
  end

  def middle_line
    translate_input_to_braille.reduce("") do |line, braille_character|
      line << braille_character[1]
    end
  end

  def bottom_line
    translate_input_to_braille.reduce("") do |line, braille_character|
      line << braille_character[2]
    end
  end

  def eighty_characters_per_line
    top = top_line
    mid = middle_line
    bot = bottom_line
    if top.length <= 80
      @output << top_line.slice!(0..79) + "\n"
      @output << middle_line.slice!(0..79) + "\n"
      @output << bottom_line.slice!(0..79)
    elsif (top.length > 80 && top.length <= 160)
      @output << top_line.slice!(0..79) + "\n"
      @output << middle_line.slice!(0..79) + "\n"
      @output << bottom_line.slice!(0..79) + "\n"
      @output << top_line.slice!(80..159) + "\n"
      @output << middle_line.slice!(80..159) + "\n"
      @output << bottom_line.slice!(80..159)
    elsif (top.length > 160 && top.length <= 240)
      @output << top_line.slice!(0..79) + "\n"
      @output << middle_line.slice!(0..79) + "\n"
      @output << bottom_line.slice!(0..79) + "\n"
      @output << top_line.slice!(80..159) + "\n"
      @output << middle_line.slice!(80..159) + "\n"
      @output << bottom_line.slice!(80..159) + "\n"
      @output << top_line.slice!(160..239) + "\n"
      @output << middle_line.slice!(160..239) + "\n"
      @output << bottom_line.slice!(160..239)
    end
      @output.join
  end
end
