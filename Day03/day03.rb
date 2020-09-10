# frozen_string_literal: true

# This class is a (x,y) Point data type
class Point
  attr_accessor :x, :y

  def initialize(x_coord, y_coord)
    @x = x_coord
    @y = y_coord
  end
end

path1 = File.expand_path('~/AdventOfCode2019/Day03/input1.txt')
dir1 = File.read(path1).split(',')
path2 = File.expand_path('~/AdventOfCode2019/Day03/input2.txt')
dir2 = File.read(path2).split(',')
len = dir1.length
pat = /([ULRD])(\d+)/
p1 = Point.new(0, 0)
p2 = Point.new(0, 0)

for i in 0..len
  # puts dir_1[i]
  m = pat.match(dir1[i])
  d1 = $1
  mag1 = $2.to_i
  m = pat.match(dir2[i])
  d2 = $1
  mag2 = $2.to_i
end
