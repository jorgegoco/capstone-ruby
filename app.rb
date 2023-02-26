require_relative './classes/musicalbum'
require_relative './classes/genre'
require_relative './classes/author'
require_relative './classes/label'
require_relative './preserve_musicalbums'
require_relative './preserve_genres'
require_relative './preserve_authors'
require_relative './preserve_labels'
require_relative './helper_functions'

class App
  def initialize
    @musicalbums = fetch_musicalbums
    @genres = fetch_genres
    @authors = fetch_authors
    @labels = fetch_labels
  end

  include PreserveMusicAlbums
  include PreserveGenres
  include PreserveAuthors
  include PreserveLabels
  include HelperFunctions

  def list_all_books
    puts 'Hello'
  end

  def list_all_music_albums
    puts '*' * 100
    puts "On Spotify\t\tPublished Date\t\tGenre "
    puts '-' * 50
    puts 'There is no Music Albums registered yet.' if @musicalbums.empty?
    @musicalbums.each do |musicalbum|
      puts "#{musicalbum.on_spotify}\t\t#{musicalbum.publish_date}\t\t#{musicalbum.genre.name} "
    end
  end

  def list_all_games
    puts 'Hello'
  end

  def list_all_genres
    puts 'Genres'
    puts '-' * 50
    @genres.each do |genre|
      puts genre.name
    end
  end

  def list_all_labels
    puts 'Labels'
    puts '-' * 50
    @labels.each do |label|
      puts "#{label.title}\t\t#{label.color}"
    end
  end

  def list_all_authors
    puts 'Authors'
    puts '-' * 50
    @authors.each do |author|
      puts "#{author.first_name}\t\t#{author.last_name}"
    end
  end

  def add_a_book
    puts 'Hello'
  end

  def add_a_music_album
    on_spotify = accept_on_spotify 'Enter if it is available on spotify [true, false]:'
    publish_date = accept_input 'Enter publish date[YYYY-MM-DD]:'
    musicalbum = MusicAlbum.new(publish_date: publish_date, on_spotify: on_spotify)
    genre = accept_input 'Enter genre[Rock, Pop ...]:'
    author_first_name = accept_input 'Enter Author first name:'
    author_last_name = accept_input 'Enter Author last name:'
    label_title = accept_input 'Enter Label title:'
    label_color = accept_input 'Enter Label color:'
    newgenre = Genre.new(name: genre)
    newauthor = Author.new(first_name: author_first_name, last_name: author_last_name)
    newlabel = Label.new(title: label_title, color: label_color)
    musicalbum.genre = newgenre
    musicalbum.author = newauthor
    musicalbum.label = newlabel
    @musicalbums.push(musicalbum)
    @genres.push(newgenre) unless @genres.include?(newgenre)
    @authors.push(newauthor) unless @authors.include?(newauthor)
    @labels.push(newlabel) unless @labels.include?(newlabel)
  end

  def add_a_game
    puts 'Hello'
  end

  def exit_app
    store_musicalbums(@musicalbums)
    store_genres(@genres)
    store_authors(@authors)
    store_labels(@labels)
    puts 'Closing the Catalog of my things!'
    exit
  end
end
