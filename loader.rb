if ARGV.empty?
  puts "Usage: ruby loader.rb bytecode.bin"
  exit!
end

file = ARGV[0]

unless File.exist?(file)
  puts "Error: File '#{file}' not found."
  exit!
end

unless File.extname(file) == ".bin"
  puts "Error: Only .bin files are supported."
  exit!
end

begin
  bytecode = File.binread(file)
  instruction_sequence = RubyVM::InstructionSequence.load_from_binary(bytecode)
  puts "Loading bytecode from: #{file}"

  instruction_sequence.eval
  puts "Bytecode executed successfully!"
rescue => e
  puts "Error: #{e.message}"
end
