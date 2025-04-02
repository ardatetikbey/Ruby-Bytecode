if ARGV.empty?
  puts "Usage: ruby converter.rb target.rb"
  exit!
end

file = ARGV[0]

unless File.exist?(file)
  puts "Error: File '#{file}' not found."
  exit!
end

unless File.extname(file) == ".rb"
  puts "Error: Only Ruby (.rb) files are supported."
  exit!
end

unless File.readable?(file)
  puts "Error: File '#{file}' is not readable."
  exit!
end

content = File.read(file)
if content.strip.empty?
  puts "Error: File '#{file}' is empty."
  exit!
end

Dir.mkdir("output") unless Dir.exist?("output")

begin
  bytecode = RubyVM::InstructionSequence.compile(content)
  puts "File: #{file}"
  puts "Bytecode Object: #{bytecode}"

  output_file = File.join("output", "#{File.basename(file, ".rb")}.bin")
  File.binwrite(output_file, bytecode.to_binary)
  puts "Bytecode saved to: #{output_file}"
rescue SyntaxError => e
  puts "Error: Syntax error in file '#{file}': #{e.message}"
  exit!
end
