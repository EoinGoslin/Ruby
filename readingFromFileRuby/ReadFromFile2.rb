def check_how_many(an_array, letter)
    numArray = Array.new
    counterNumTimes = 0
    counterNumTimesAtStart = 0
    
   
     # the letter to check will be passed here
    an_array.select do |item|
        #checking for letter in general in the word
      if(item.match /#{letter}/)
        then 
        puts "#{item}"
        #write item to info.txt
       
        File.open("info.txt", "a") do |line|
            #print for same line
            #puts for new line
            line.print "#{item} "
        end
        counterNumTimes = counterNumTimes + 1
       
      end
      #Checking if the letter is at the start if the word
      
      if(item.match /^#{letter}/)
        then 
        puts "#{item}"
        counterNumTimesAtStart = counterNumTimesAtStart + 1
       
      end

       
    end #end of do
    numArray[0] = counterNumTimes
    numArray[1] = counterNumTimesAtStart
    return numArray
end


a = Array.new

whole_string = ""
puts "What letter to check for: ..."
letter = gets.chomp


#Reading from a text file
File.open("info.txt", "r") do |inFile|
    
    while(line = inFile.gets) 
        #puts "#{line}" 
        whole_string += line
    end
    a = whole_string.split(" ")
    #print a
   numberOfOverall = Array.new
   numberOfOverall = check_how_many(a, letter) 
    p "The number of the words that contain the letter somewhere are #{numberOfOverall[0]}"
    #numStartWith = check_how_many_start_with(a, letter) 
    p "The number of words where the letter is at the start is #{numberOfOverall[1]}"

end


