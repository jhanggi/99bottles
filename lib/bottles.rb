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
      "no more bottles of beer"
    when 1
      "#{to_i} bottle of beer"
    else
      "#{to_i} bottles of beer"
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

  def take_one(other)
    self.class.new(to_i - other.to_i)
  end
  alias - take_one
end

class Bottles
  TOTAL = Container.new(99)

  def verse(i)
    count = Container.new(i)

    [situation(count),
     action_and_resolution(count),
     "" # to get the extra newline
    ].join("\n")
  end

  def verses(end_verse, start_verse)
    end_verse.downto(start_verse).map { |v| verse(v) }.join("\n")
  end

  def song
    verses(TOTAL, 0)
  end

  private

  def situation(count)
    "#{in_location(count).capitalize}, #{count}."
  end

  def in_location(count)
    "#{count} on the wall"
  end

  def action_and_resolution(count)
    if count.to_i == 0
      "Go to the store and buy some more, #{in_location(TOTAL)}."
    else
      "Take #{count.pronoun} down and pass it around, #{in_location(count - 1)}."
    end
  end

end
