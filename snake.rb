class Segment
  attr_accessor :y, :x

  def initialize(y, x)
    @y, @x = y, x
  end
end

class Head < Segment
end

class Body < Segment
end

class Snake
  attr_accessor :segments

  def initialize(head)
    @segments = [head]
  end

  # Добавить новый сегмент(на след ход)
  def add_new_segment
    @segments << Body.new(tail.y, tail.x) # координаты хвоста, тоесть останутся такими(родятся) на след ход
    self
  end

  # Движение головы
  def up
    body_move
    @segments[0].y -= 1
    self
  end

  def down
    body_move
    @segments[0].y += 1
    self
  end

  def left
    body_move
    @segments[0].x -= 1
    self
  end

  def right
    body_move
    @segments[0].x += 1
    self
  end

  # Показать сегмент
  def head
    @segments[0]
  end

  def tail
    @segments[-1]
  end

  private

  # Движение тела
  def body_move
    return if @segments.size < 2
    (@segments.size-1).downto(1) do |i|
      @segments[i].y = @segments[i-1].y
      @segments[i].x = @segments[i-1].x
    end
  end
end
