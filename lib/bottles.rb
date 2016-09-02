class Bottles
  def verse(i)
    case i
    when 0
      <<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
    when 1
      expected = <<-VERSE
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
    VERSE
    when 2
      <<-VERSE
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
    VERSE
    else
      <<-VERSE
#{i} bottles of beer on the wall, #{i} bottles of beer.
Take one down and pass it around, #{i-1} bottles of beer on the wall.
VERSE
    end
  end

  def verses(end_verse, start_verse)
    end_verse.downto(start_verse).map { |v| verse(v) }.join("\n")
  end

  def song
    verses(99, 0)
  end
end
