class App
  def initialize
    @books = fetch_books
    @albums = fetch_albums
    @games = fetch_games
    @genres = fetch_genres
    @labels = fetch_labels
    @authors = fetch_authors
  end

  def list_all_books
  end

  def list_all_music_albums
  end

  def list_all_games
  end

  def list_all_genres
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
