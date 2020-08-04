require "./lib/translator"
module FileHandler

  def self.translate_to_braille(english_file_name, braille_file_name)

    contents = File.read(english_file_name)
    translator = Translator.new(contents)
    File.open(braille_file_name, "w") do |file|
      file.write translator.translate_to_braille_max_eighty_chars
    end
    "Created #{braille_file_name} containing #{File.read(braille_file_name).chomp.length} characters."
  end

  def self.translate_to_english(braille_file_name, english_file_name)

    contents = File.read(braille_file_name)
    translator = Translator.new(contents)
    File.open(english_file_name, "w") do |file|
      file.write translator.translate_braille_to_english
    end
    "Created #{english_file_name} containing #{File.read(english_file_name).chomp.length} characters."
  end

end
