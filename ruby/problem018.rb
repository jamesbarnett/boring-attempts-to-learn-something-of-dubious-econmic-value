#!/usr/bin/env ruby -w

str = <<-DATA
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
DATA

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    self.value = value
  end

  def self.parse(data)
    i = 0
    lines = data.split("\n")
    root = Node.new(lines.first.to_i)
    parse_lines(lines)
  end

  def output buffer
    buffer += "#{value}\n"
    buffer += "#{left.value} #{right.value}\n"
    buffer
  end

  def inspect
    self.value
  end
  private

  def self.parse_lines(lines, index = 0)
    parents = lines[index].split.map {|n| Node.new(n.to_i) }
    children = lines[index+1].split if index < lines.size - 1
    parents.each_with_index do |parent, i|
      if index < lines.size - 1
        if i == 0
          parent.left = Node.new(children[i * 2].to_i)
          parent.right = Node.new(children[i * 2 + 1].to_i)
        else
          parent.left = parents[i - 1].right
          parent.right = Node.new(children[i * 2 + 1].to_i)
        end
      else

      end
      index += 1
      parse_lines(lines, index) if index < lines.size - 1
    end

    parents.first
  end
end

def traverse_routes(root, queue = [])
  routes = {}
  queue << root
  routes = traverse_routes_helper(routes, queue)
end

def traverse_routes_helper(routes, queue)
  node = queue.pop
  routes[node] = {}

  left_routes = nil
  right_routes = nil

  if node.left
    queue << node.left
    left_routes = traverse_routes_helper(routes, queue) if node.left
  end

  if node.right
    queue << node.right
    right_routes = traverse_routes_helper(routes, queue) if node.right
  end
  routes[:left] = left_routes if left_routes
  routes[right_routes] if right_routes
  routes
end

ns = Node.parse(str)
puts traverse_routes(ns).inspect

