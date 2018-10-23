require_relative 'library'
require_relative 'user'
require_relative 'book'


#First create books, library and a user


b = Book.new("Catch 22","Joseph Heller", 500, 80, "comedy")
c = Book.new("Lord of the Rings","J. R. R. Tolkien", 5000, 20, "fantasy")
e = Book.new("Nineteen Eighty-Four","George Orwell", 58, 60, "classic")
f = Book.new("Java Book","Dr Java", 10, 10, "educational")
g = Book.new("Leaving Cert Book","Teacher", 10, 50, "horror")

lib = Library.new() #create the library, lib is now the library
#adding books onto its shelves
lib.addBook(Book.new("To Kill a MockingBird","Harper Lee", 500, 55, "classic"))
lib.printBooks
lib.addBook(b,c)
lib.addBook(e,f)
lib.addBook(g)
#lib.printBooks

#create users
eoin = User.new("eoin", "Dubin", "classic", 50)
john = User.new("John", "Mexico", "horror", 10)
#p eoin.userID
#p john.userID


# tell the user which library to go to to take out the book, this allows for the situation where different users could go to different libraries
#user can only borrow books which have not already been taken out, otherwise get a message stating this
eoin.borrowBook("To Kill a MockingBird", lib) 
#test message if book already taken out
# john.borrowBook("To Kill a MockingBird", lib)
john.borrowBook("Java Book", lib)

#lib.printBooksToBorrow # now shows two books less as other two are already on loan
#shows To Kill a MockingBird
#eoin.showUsersBooks
#shows Java Book
#john.showUsersBooks

eoin.returnBook("To Kill a MockingBird", lib)
puts "now printing eoins books"
eoin.showUsersBooks # now shows no books

puts "Now printing library books to borrow now"

lib.printBooksToBorrow # now shows To Kill a MockingBird available again

puts "Now printing books by Price given"
#returns all books <= to price given
lib.returnBooksByPrice(eoin.budget)

#returns all books in library by Genre
puts "By Genre"
lib.returnBooksByGenre(john.favouriteGenre)

