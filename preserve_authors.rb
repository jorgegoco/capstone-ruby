require 'json'

module PreserveAuthors
  def fetch_authors
    authors_array = []
    authors_file = 'authors.json'
    return authors_array if !File.exist?(authors_file) || File.read(authors_file) == ''

    JSON.parse(File.read(authors_file)).each do |author|
      authors_array << Author.new(first_name: author['first_name'], last_name: author['last_name'])
    end

    authors_array
  end

  def store_authors(authors)
    authors_array = []
    authors.each { |author| authors_array.push({ first_name: author.first_name, last_name: author.last_name }) }
    File.write('authors.json', JSON.generate(authors_array))
  end
end
