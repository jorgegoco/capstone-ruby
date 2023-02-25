class App
  def initialize
    # @books = fetch_books
    @musicalbums = fetch_musicalbums
    @genres = fetch_genres
    # @games = fetch_games
  end

include PreserveMusicAlbums
include PreserveGenres

  def list_all_books
  end

  def list_all_music_albums
    puts '*' * 100
    puts "On Spotify\tPublished Date\tGenre "
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
  end

  def add_a_game
  end
end
