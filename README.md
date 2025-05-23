# Ruby-Bytecode Tools

This project allows you to convert Ruby source files (.rb) into bytecode files (.bin), load and execute the bytecode, and disassemble it to inspect the Ruby bytecode.

## Features
- Convert Ruby source code to bytecode: Convert .rb files into .bin bytecode files.

- Execute Ruby bytecode: Load and execute bytecode from .bin files.

- Disassemble bytecode: View the disassembled bytecode for inspection.

## Requirements
- Ruby 2.6 or higher

- Ruby's RubyVM::InstructionSequence for bytecode compilation and execution

## Usage

- To convert a .rb file into a .bin bytecode file:

```bash
ruby converter.rb path/to/your_script.rb  
```

- To execute the bytecode from a .bin file:

```bash
ruby loader.rb path/to/your_script.bin
```

- To view the disassembled bytecode from a .bin file:

```bash
ruby disassemble.rb path/to/your_script.bin
```
