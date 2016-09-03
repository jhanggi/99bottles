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
      "no more #{pluralized} of beer"
    else
      "#{to_i} #{pluralized} of beer"
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

  def succ
    if to_i == 0
      self.class.new(99)
    else
      self.class.new(to_i - 1)
    end
  end

  private

  def pluralized
    if to_i == 1
      "bottle"
    else
      "bottles"
    end
  end
end

class Bottles
  TOTAL = Container.new(99)

  def verse(i)
    count = Container.new(i)

    [situation(count),
     "#{action(count)}, #{in_location(count.succ)}.",
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

  def action(count)
    if count.to_i == 0
      "Go to the store and buy some more"
    else
       "Take #{count.pronoun} down and pass it around"
    end
  end

end
