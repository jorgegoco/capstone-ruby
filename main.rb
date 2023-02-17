require_relative './app'

class Menu
  def initialize
    @app = App.new
  end

  def text_menu
    puts "
        Please choose an option by entering a number:
        1 - List all books
        2 - List all music albums
        3 - List all movies
        4 - List of games
        5 - List all genres
        6 - List all labels
        7 - List all authors
        8 - List all sources
        9 - Add a book
        10 - Add a music album
        11 - Add a movie
        12 - Add a game
        13 - Exit"
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength

  def main_menu
    loop do
      text_menu
      id = gets.chomp.to_i
      case id
      when 1
        @app.list_all_books
      when 2
        @app.list_all_music_albums
      when 3
        @app.list_all_movies
      when 4
        @app.list_of_games
      when 5
        @app.list_all_genres
      when 6
        @app.list_all_labels
      when 7
        @app.list_all_authors
      when 8
        @app.list_all_sources
      when 9
        @app.add_a_book
      when 10
        @app.add_a_music_album
      when 11
        @app.add_a_movie
      when 12
        @app.add_a_game
      else
        exit_app
      end
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength

  private

  def exit_app
    puts 'Closing the Catalog of my things!'
    exit
  end
end

def main
  puts 'Welcome to Catalog of my things!'
  menu = Menu.new
  menu.main_menu
end

main
