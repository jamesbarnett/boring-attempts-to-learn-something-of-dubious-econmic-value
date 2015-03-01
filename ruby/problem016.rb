#!/usr/bin/env ruby -w

n = 2 ** 1000
puts n.to_s.chars.inject(0) {|acc, val| acc + Integer(val) }

