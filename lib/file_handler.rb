module FileHandler

  def self.read_and_write_file(input, output)

    contents = File.read(input)
    File.open(output, "w") do |file|
      file.write contents
    end
    "Created #{output} containing #{File.read(output).chomp.length} characters."
  end

  def self.read_and_translate_file(input, output)

    contents = File.read(input)
    printer = Printer.new(contents)
    File.open(output, "w") do |file|
      file.write printer.translate_to_braille_max_eighty_chars
    end
  end

end
