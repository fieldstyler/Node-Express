require "./lib/dictionary"
require "./lib/file_handler"
class Translator

  attr_reader :dictionary,
              :input,
              :output
  def initialize(input)
    @dictionary = Dictionary.new
    @input = input
    @output = []
  end

  def separate_english_characters
    @input.chars
  end

  def translate_english_to_braille
    separate_english_characters.map do |input|
      @dictionary.english_to_braille[input]
    end.compact
    #todo: edge case if key doesn't exist???
  end

  def top_line
    translate_english_to_braille.reduce("") do |line, braille_character|
      line << braille_character[0]
    end
  end

  def middle_line
    translate_english_to_braille.reduce("") do |line, braille_character|
      line << braille_character[1]
    end
  end

  def bottom_line
    translate_english_to_braille.reduce("") do |line, braille_character|
      line << braille_character[2]
    end
  end

  def translate_to_braille_max_eighty_chars
    separate_english_characters
    translate_english_to_braille
    top = top_line
    mid = middle_line
    bot = bottom_line
    counter = 0
    if top.length % 80 == 0
      number_of_rows = top.length / 80
    else
      number_of_rows = (top.length / 80) + 1
    end
    number_of_rows.times do
      if top.length > 80
        @output <<  top.slice!(0..79) + "\n" +
                    mid.slice!(0..79) + "\n" +
                    bot.slice!(0..79) + "\n"
      else
        @output <<  top.slice!(0..-1) + "\n" +
                    mid.slice!(0..-1) + "\n" +
                    bot.slice!(0..-1)
      end
    end
      @output.join
  end
#----------------------------------------------------------------------
  def separate_braille
    split_input = input.split("\n")
    length_of_input = split_input.length
    remade_chunks = []
    split_input[0].each_char.with_index do |chunk, index|
      if index.even?
        remade_chunks <<  [split_input[0][index] + split_input[0][index + 1],
                          split_input[1][index] + split_input[1][index + 1],
                          split_input[2][index] + split_input[2][index + 1]]
      #if remade_chunks matches capital, use split_input[1..4] and skip next iteration
      end
    end
    remade_chunks
  end

  def translate_braille_to_english
    separate_braille.map do |chars|
      @dictionary.braille_to_english[chars]
    end.join
    #todo: edge case if key doesn't exist???
  end

end
