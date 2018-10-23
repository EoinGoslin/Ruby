=begin
Book class will define what a book contains
Book will be made up of - title, author, unique id, pageNumbers, price(e.g. 10) and genre
Instances will be created in Top.rb
=end
class Book 
    attr_accessor :title, :author, :id, :pageNum, :price, :genre
    @@uniqueNumber = 0 #this number will count how many instances of the class user there are and use that as uniqueID

    
    def initialize(title, author,pageNum, price, genre)
        #initialize instance variables
        @title = title
        @author = author
        @id = @@uniqueNumber += 1 
        @pageNum = pageNum
        @price = price
        @genre = genre
    end # end of initializer



        

end # end of class


