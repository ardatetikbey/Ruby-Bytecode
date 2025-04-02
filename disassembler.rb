if ARGV.empty?
  puts "Usage: ruby disassemble.rb bytecode.bin"
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

  puts "Disassembling bytecode from: #{file}"
  puts "Disassembled Bytecode: \n#{instruction_sequence.disasm}"
rescue => e
  puts "Error: #{e.message}"
end
