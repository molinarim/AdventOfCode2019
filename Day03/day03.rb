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
def step(p, d, m, visited, h)
  s = 1
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

    x = p.x
    y = p.y
    visited << [p.x, p.y]

    h[[x, y]] = s unless h[[x, y]] # h.key?([p.x, p.y])
    s += 1
  end
end

visited1 = Set.new
visited2 = Set.new
h1 = {}
h2 = {}
steps1 = 0
steps2 = 0

# Used regex to get direction and number of steps taken.
for i in 0...len
  pat.match(dir1[i])
  d1 = $1
  mag1 = $2.to_i
  step(p1, d1, mag1, visited1, h1)
  pat.match(dir2[i])
  d2 = $1
  mag2 = $2.to_i
  step(p2, d2, mag2, visited2, h2)
end

############### Part 1
# Keep only the steps where there is overlap and find the closest to the origin.
intersection = visited1 & visited2
#puts intersection.map { |x, y| x.abs + y.abs }.min

############### Part 2
# puts h1
#puts h1.keys & h2.keys
h_keys_inter = h1.keys & h2.keys
#puts h_keys_inter
puts h_keys_inter.map { |x, y| h1[[x, y]] + h2[[x, y]] }

#h_intersection = h1.keep_if { |k, _v| h2.key?(k) }
#h2.keep_if { |k, _v| h1.key?(k) }
#puts h1.size
#puts h2.size
#step_intersection = 
#h_intersection.each_key { }.min

# a = {}
# h_intersection.each { |k, v| a[k] = h2[k] + v }
# puts a.values
