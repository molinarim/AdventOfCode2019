# frozen_string_literal: true

require 'set'

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

# Change point's location based on direction. Store each step in visited.
def step(p, d, m, visited)
  m.times do
    case d
    when 'U'
      p.y += 1
    when 'L'
      p.x -= 1
    when 'R'
      p.x += 1
    when 'D'
      p.y -= 1
    end

    visited << [p.x, p.y]
  end
end

visited1 = Set.new
visited2 = Set.new

# Used regex to get direction and number of steps taken.
for i in 0...len
  pat.match(dir1[i])
  d1 = $1
  mag1 = $2.to_i
  step(p1, d1, mag1, visited1)
  pat.match(dir2[i])
  d2 = $1
  mag2 = $2.to_i
  step(p2, d2, mag2, visited2)
end

# Keep only the steps where there is overlap and find the closest to the origin.
intersection = visited1 & visited2
puts intersection.map { |x, y| x.abs + y.abs }.min
