require "forwardable"

class Container
  extend Forwardable

  def_delegator :to_i, :downto

  def initialize(count)
    @count = count
  end

  def to_i
    @count
  end

  def to_s
    case to_i
    when 0
      "no more bottles"
    when 1
      "#{to_i} bottle"
    else
      "#{to_i} bottles"
    end
  end

  def pronoun
    case to_i
    when 1
      "it"
    else
      "one"
    end
  end

  def -(other)
    self.class.new(to_i - other.to_i)
  end
end

class Bottles
  TOTAL = Container.new(99)

  def verse(i)
    count = Container.new(i)
    case i
    when 0
      <<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, #{TOTAL} of beer on the wall.
    VERSE
    else
      <<-VERSE
#{count} of beer on the wall, #{count} of beer.
Take #{count.pronoun} down and pass it around, #{count - 1} of beer on the wall.
VERSE
    end
  end

  def verses(end_verse, start_verse)
    end_verse.downto(start_verse).map { |v| verse(v) }.join("\n")
  end

  def song
    verses(TOTAL, 0)
  end
end
