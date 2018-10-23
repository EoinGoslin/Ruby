require_relative 'library'
=begin
define a user class, the person who interacts with the library
have a name, address, unique-id, 
favourite genre(will later return to the user all of their favourite genres to them to pick from)
priceRange will be used to get a list of books in their price range back from library
=end


class User
    attr_accessor :name, :address, :userID, :favouriteGenre, :budget, :usersBooks
    @@uniqueNumber = 0 #this number will count how many instances of the class user there are and use that as uniqueID
    # @@uniqueNumber = 0

    def initialize(name, address, favouriteGenre, budget)
        @name = name
        @address = address
        @userID = @@uniqueNumber += 1 
        @favouriteGenre = favouriteGenre
        @budget = budget
        @usersBooks = Array.new
    end # end of initializer

    #Method returns all books by user's favourite genre
    def borrowBook(userBookTitle, lib)
        found = false
        foundIndex = 0 #will be place book has been found
        lib.books.each_with_index do #for all books in library
            |book, index| #This book
            #book[0] holds just the key of all the book in the hash
            #book[1] holds availablility and the book itself
            #For every book, check if available
        book[1][0].select do # Select this books key and value
            |key, value|
            if(value.title == userBookTitle) #check for book
                p "Found the title #{userBookTitle}, checking availability..."
                if(key == "available") # check if available
                    
                    #book now taken out so book is now unavailable
                    foundIndex = index                   
                    found = true
                else
                    p "Book is already on loan, the library apologises for this inconvenience"
                end #end of if/else
            end
            
        end #end inner do


        end #end outer do
       
        if(found == true)
            p "Book is available, assigning book to user and removing from library..."
            @usersBooks.push(lib.books[foundIndex][0]["available"])
            lib.books[foundIndex][0]["unavailable"] = lib.books[foundIndex][0].delete("available")
        else
            p "Check Back soon for the book"
      
         
        end
    end #end method



    #return book to the library

    def returnBook(userBookTitle, lib)
        found = false
        foundIndex = 0 #will be place book has been found
        indexToDeleteAt = 0
        lib.books.each_with_index do #for all books in library
            |book, index| #This book
            #book[0] holds just the key of all the book in the hash
            #book[1] holds availablility and the book itself
            #For every book, check if available
        book[1][0].select do # Select this books key and value
            |key, value|
            if(value.title == userBookTitle) #check for book
                p "Found the title #{userBookTitle}"
                if(key == "unavailable") # check if available
                   
                    
                    #book now taken out so book is now unavailable
                    foundIndex = index                   
                    found = true
                else
                    p "Book is already in the library, was never borrorw from here"
                end #end of if/else
            end
            
        end #end inner do


        end #end outer do
       
        if(found == true)
            p "now returning the title..."
           
          
            #search for book to remove correct one from the user's collection
            
            #go through the array and reject anything that returns true, i.e. if title belongs to user, delete it
            @usersBooks.reject! { |element| element.title == lib.books[foundIndex][0]["unavailable"].title }
            
            lib.books[foundIndex][0]["available"] = lib.books[foundIndex][0].delete("unavailable")
        else 
            p "Book is not from this library, sorry was never in stock"
         
        end
       
       
    end #end method


    def showUsersBooks
        puts "user #{@name}'s books are: "
        @usersBooks.select do
            |book|
            p book
        end
    end


    

end #end of class


