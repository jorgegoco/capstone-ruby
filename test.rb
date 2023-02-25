require_relative './classes/item'
require_relative './classes/book'
require_relative './classes/label'

book = Book.new('date', 'publisher', 'bad')
p book
p book.can_be_archived?
p label = Label.new('title', 'color')
label.add_item(book)
p label
p book