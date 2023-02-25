class Author
  attr_accessor :first_name, :second_name, :items

  def initialize(first_name:, last_name:)
    @first_name = first_name
    @second_name = @second_name
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.author = self
  end
end