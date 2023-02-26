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

end