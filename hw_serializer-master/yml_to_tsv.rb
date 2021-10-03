require 'yaml'

# Check the output file
outname = ARGV[1]

# Deserialize
survey = YAML.safe_load(File.read(ARGV[0]))
# Create the TSV file
line = ''
survey[0].each_key { |key| line.concat("#{key}\t") }
File.open(outname, 'w') do |file|
  file.puts line
  survey.each do |record|
    record.each_value { |value| file << "#{value}\t" }
    file << "\n"
  end
end
