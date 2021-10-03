# frozen_string_literal: true

require 'yaml'

outname = ARGV[1]
# Build the array of Hashes
survey = []
lines = []
tsv_file = File.open(ARGV[0], 'r')
tsv_file.each_line { |line| lines << line }
tsv_file.close
keys = lines[0].split("\t")
lines.shift
lines.each do |line|
  values = line.split("\t")
  record = {}
  keys.each_index { |index| record[keys[index].chomp] = values[index].chomp }
  survey.push(record)
end
# Serialize the data
File.open(outname, 'w') do |file|
  file.puts survey.to_yaml
end
