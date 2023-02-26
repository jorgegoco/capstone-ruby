require 'date'

module HelperFunctions
  def accept_input(msg)
    puts msg
    gets.chomp
  end

  def accept_on_spotify(msg)
    puts msg
    data = gets.chomp.downcase
    unless ['false', 'true', ''].include? data
      puts msg
      puts 'Press Enter for no value!!'
      data = gets.chomp.downcase
    end
    data
  end

  def accept_date(msg)
    begin
      puts 'Enter publish date[YYYY-MM-DD]:'
      data = gets.chomp 
      Date.strptime(data, '%Y-%m-%d')
    rescue
      puts 'Invalid date!!'
      retry
    end
    data 
  end

  def accept_on_cover_state(msg)
    puts msg
    data = gets.chomp.downcase
    unless ['bad', 'good', ''].include? data
      puts msg
      puts 'Press Enter for no value!!'
      data = gets.chomp.downcase
    end
    data
  end
end