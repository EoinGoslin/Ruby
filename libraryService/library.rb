require_relative 'book.rb'
=begin
define a library class, 
record books in the libray - need to require book class
whichever books are available to borrow can be taken out need
book will contain book object, as well as status saying available/unavailable 

books is an array


Create a method that takes in an array of books
=end

class Library
    attr_reader :books
    

    def initialize()
        @books = Hash.new # create array used to store all the books in the library
    end

    def printBooks # print all books in the library
        p "The total numer of Books is : " + @books.length.to_s
       @books.each_with_index do  
        |item, index| 
       
        p "Book number #{index} is #{item.inspect}"
       end
      
    
        
    end

    def addBook(*b) #using splat to add more than one book at a time if needed
        #For every argument passed, add to Hash using index 
        #Make book available at start
        if(@books.length == 0)
           
            b.each_with_index do
            |item, index|
            @books[index] = []
            @books[index][0] = {"available"=>item} 
            
            end
        else

        #In else statement I know there is at least one book in Hash
        lastIndex = @books.length
        b.each do
            |item| # book argument passed in
            @books[lastIndex] = []
            @books[lastIndex][0] = {"available"=>item} 
            lastIndex = lastIndex+1 # so next Book gets placed in next slot and also has a key that is one number higher
        end
        
        end


        
    end # end of method


    def printBooksToBorrow
        # index is all the keys in the Hash
        
        @books.each do 
            |book|
            #book[0] holds just the key of all the book in the hash
            #book[1] holds availablility and the book itself
            #For every book, check if available
        book[1][0].select do
            |key, value|
            if(key=="available")
                p value
            end #end if
        end #end inner do
        end #end outer do



    end #end of method

    #Returns all books that are within the user's budget
    def returnBooksByPrice(userBudget)
        @books.each do 
            |book|
            #book[0] holds just the key of all the book in the hash
            #book[1] holds availablility and the book itself
            #For every book, check if available
        book[1][0].select do
            |key, value|
            if(value.price <= userBudget)
                p value
            end
        end #end inner do
        end #end outer do
    end #end method

    #Method returns all books by user's favourite genre
    def returnBooksByGenre(userGenre)
        @books.each do 
            |book|
            #book[0] holds just the key of all the book in the hash
            #book[1] holds availablility and the book itself
            #For every book, check if available
        book[1][0].select do
            |key, value|
            if(value.genre == userGenre)
                p value
            end
        end #end inner do
        end #end outer do
    end #end method

    


    
end #end of the class












