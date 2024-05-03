class Game
  attr_reader :snake, :field

  def initialize(size)
    @size = size
    @y, @x = @size/2, @size/2
    @snake = Snake.new(Head.new(@y, @x))
  end

  # Помещаем змейку в игровое поле
  def field_init
    @field = Array.new(@size){ Array.new(@size) { ' ' } }
    @snake.segments.each{|segment| @field[segment.y][segment.x] = segment.class.to_s[0]}
  end

  # Для отображения поля в терминале
  def show_field
    @field.map{|a| a.join}#.join('\n')
  end
end
