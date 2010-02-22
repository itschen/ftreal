input_file = "ExportAccount.txt"
output_file = "output.txt"

out = File.new(output_file, "w")

count = 0
IO.foreach(input_file) do |line|
  columns = line.split(',')
  puts columns.values_at(0,1,2,8,9,10,11,18).join(',')
  count += 1
  break if count >= 10
end
out.close

puts "done, see #{output_file}"