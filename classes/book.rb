class Book < Item
  def initialize(publisher, cover_state)
    super()
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super == true || cover_state == 'bad'

    false
  end
end
