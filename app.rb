require_relative './classes/musicalbum'
require_relative './classes/genre'
require_relative './classes/author'
require_relative './preserve_musicalbums'
require_relative './preserve_genres'
require_relative './preserve_authors'

class App
  def initialize
    @musicalbums = fetch_musicalbums
    @genres = fetch_genres
    @authors = fetch_authors
  end

include PreserveMusicAlbums
include PreserveGenres
include PreserveAuthors

  def list_all_books
  end

  def list_all_music_albums
    puts '*' * 100
    puts "On Spotify\t\tPublished Date\t\tGenre "
    puts '-' * 50
    puts 'There is no Album registered yet.' if @musicalbums.empty?
    @musicalbums.each do |musicalbum|
      puts "#{musicalbum.on_spotify}\t\t#{musicalbum.publish_date}\t\t#{musicalbum.genre.name} "
    end
  end

  def list_all_games
  end

  def list_all_genres
    puts 'Genres'
    puts '-' * 50
    @genres.each do |genre|
      puts genre.name
    end
  end

  def list_all_labels
  end

  def list_all_authors
  end

  def add_a_book
  end

  def add_a_music_album
    on_spotify = accept_input 'Enter if it is available on spotify [true, false]:'
    publish_date = accept_input 'Enter publish date[YYYY-MM-DD]:'
    musicalbum = MusicAlbum.new(publish_date: publish_date, on_spotify: on_spotify)
    genre = accept_input 'Enter genre[Rock, Pop ...]:'
    author_first_name = accept_input 'Enter Author first name:'
    author_last_name = accept_input 'Enter Author last name:'
    newgenre = Genre.new(name: genre)
    newauthor = Author.new(first_name: author_first_name, last_name: author_last_name)
    musicalbum.genre = newgenre
    musicalbum.author = newauthor
    @musicalbums.push(musicalbum)
    @genres.push(newgenre) unless @genres.include?(newgenre)
    @authors.push(newauthor) unless @authors.include?(newauthor)
  end

  def add_a_game
  end
  
  def exit_app
    store_musicalbums(@musicalbums)
    store_genres(@genres)
    store_authors(@authors)
    puts 'Closing the Catalog of my things!'
    exit
  end

  def accept_input(msg)
    puts msg
    gets.chomp
  end
end
