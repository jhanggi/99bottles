class Bottles
  def verse(i)
    <<-VERSE.gsub /^\s+/, ""
    99 bottles of beer on the wall, 99 bottles of beer.
    Take one down and pass it around, 98 bottles of beer on the wall.
    VERSE
  end
end
