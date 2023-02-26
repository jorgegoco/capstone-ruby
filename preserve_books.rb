require 'json'

module PreserveBooks
  def fetch_books
    books_array = []
    books_file = 'books.json'
    return books_array if !File.exist?(books_file) || File.read(books_file) == ''

    json_books = File.read('books.json')
    data_books = JSON.parse(json_books)
    class_books = data_books.map do |book|
      newbook = book.new(publish_date: book['publish_date'], publisher: book['publisher'], cover_state: book['cover_state'])
      newbook.genre = Genre.new(name: book['genre'])
      newalbum
    end
    class_books.map { |book| books_array.push(book) }
    books_array
  end

  def store_books(books)
    books_array = []
    books.each do |book|
      books_array.push({ publish_date: book.publish_date, publisher: book.publisher, 
      cover_state: book.cover_state, genre: book.genre.name })
    end
    File.write('books.json', JSON.generate(books_array))
  end
end
