require "./lib/file_handler"
include FileHandler

FileHandler.translate_to_braille(ARGV[0], ARGV[1])
