# frozen_string_literal: true

############## Part 1
# Both recursive and iterative solutions are correct
program = File.read(File.expand_path('~/AdventOfCode2019/Day02/input.txt'))
              .split(',').map(&:to_i)
program[1] = 12
program[2] = 2

def op_add(prog, index)
  op1_index = prog[index + 1]
  op1 = prog[op1_index]
  op2_index = prog[index + 2]
  op2 = prog[op2_index]
  dest_index = prog[index + 3]
  prog[dest_index] = op1 + op2
end

def op_mult(prog, index)
  op1_index = prog[index + 1]
  op1 = prog[op1_index]
  op2_index = prog[index + 2]
  op2 = prog[op2_index]
  dest_index = prog[index + 3]
  prog[dest_index] = op1 * op2
end

# Recursive version
# opcode 1: add numbers from first two positions, store in third
# opcode 2: multiply numbers from first two positions, store in third
# opcode 99: halt
# after processing opcode, step forward 4 spaces
def proc(prog, index)
  instr = prog[index]

  case instr
  when 1
    op_add(prog, index)
    proc(prog, index + 4)
  when 2
    op_mult(prog, index)
    proc(prog, index + 4)
  end
end

# Iterative version
i = 0
prog = program[0]

until prog == 99
  case prog
  when 1
    op = :+
  when 2
    op = :*
  end

  o1_index = program[i + 1]
  o2_index = program[i + 2]
  o1 = program[o1_index]
  o2 = program[o2_index]
  dest_index = program[i + 3]
  program[dest_index] = o1.send(op, o2)
  i += 4
  prog = program[i]
end

# proc(program, 0)
puts program[0]

############## Part 2

