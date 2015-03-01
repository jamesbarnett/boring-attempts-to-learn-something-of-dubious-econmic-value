#!/usr/bin/env ruby -w

Dir["problem*.rb"].each do |file|
  cmd = "time ruby #{file}"
  puts cmd
  puts `#{cmd}`
end
