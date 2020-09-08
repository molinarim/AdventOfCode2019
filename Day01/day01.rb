# frozen_string_literal: true

puts Dir.pwd
######### PART 1
# Calculate how much fuel is needed for each module.
file = File.open(File.expand_path('~/AdventOfCode2019/Day01/input.txt'), 'r')
modules = file.readlines.map(&:chomp).map(&:to_i)
file.close
fuel = 0

def calc_fuel(mod)
  mod / 3 - 2
end

modules.each { |mod| fuel += calc_fuel(mod) }

puts fuel

########## PART 2
# Calculate how much fuel is needed for each module while taking into account
# that fuel adds weight and would need more fuel to launch.
fuel = 0

# mod is the same in calc_fuel method, acc is the accumulator for the fuel of
# the module and the weight of the fuel.  If the calculated fuel is 0 or
# negative then just return acc.
def calc_weight(mod, acc)
  fuel = calc_fuel(mod)
  fuel <= 0 ? acc : calc_weight(fuel, acc + fuel)
end

modules.each { |mod| fuel += calc_weight(mod, 0) }

puts fuel
