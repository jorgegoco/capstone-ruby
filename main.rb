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
        3 - List of games
        4 - List all genres
        5 - List all labels
        6 - List all authors
        7 - Add a book
        8 - Add a music album
        9 - Add a game
        10 - Exit"
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
        @app.list_all_games
      when 4
        @app.list_all_genres
      when 5
        @app.list_all_labels
      when 6
        @app.list_all_authors
      when 7
        @app.add_a_book
      when 8
        @app.add_a_music_album
      when 9
        @app.add_a_game
      when 10
        @app.exit_app
      else
        puts 'Invalid input!!'
      end
    end
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength

def main
  puts 'Welcome to Catalog of my things!'
  menu = Menu.new
  menu.main_menu
end

main
