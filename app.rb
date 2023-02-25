require_relative './classes/musicalbum'
require_relative './classes/genre'
require_relative './preserve_musicalbums'
require_relative './preserve_genres'

class App
  def initialize
    @musicalbums = fetch_musicalbums
    @genres = fetch_genres
  end

include PreserveMusicAlbums
include PreserveGenres

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
    newgenre = Genre.new(name: genre)
    musicalbum.genre = newgenre
    @musicalbums.push(musicalbum)
    @genres.push(newgenre) unless @genres.include?(newgenre)
  end

  def add_a_game
  end
  
  def exit_app
    store_musicalbums(@musicalbums)
    store_genres(@genres)
    puts 'Closing the Catalog of my things!'
    exit
  end

  def accept_input(msg)
    puts msg
    gets.chomp
  end
end
