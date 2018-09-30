#Read from text file
=begin
Ruby has a Class named File 
that can be used to perform a variety of methods on a file.
.each becomes each line of the file
=end
File.open("info.txt").each do |line|
    puts line
end
#Write to end of txt file
#a means append
a = Array.new
a = ["a " , "value ", "in " , "an " , "array."]

File.open("info.txt", "a") do |line|
    a.select do |element|
        line.puts  "#{element}"
    end
end