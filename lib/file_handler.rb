module FileHandler

  def self.read_and_write_file(input, output)

    contents = File.read(input)
    File.open(output, "w") do |file|
      file.write contents
    end
    "Created #{output} containing #{File.read(output).chomp.length} characters."
  end
end
