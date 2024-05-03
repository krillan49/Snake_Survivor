class Game
  attr_reader :snake, :field

  def initialize(size)
    @size = size
    @y, @x = @size/2, @size/2
    @snake = Snake.new(Head.new(@y, @x))
    @field = Array.new(@size){ Array.new(@size) { ' ' } }
  end

  # Заполняем игровое поле на этот ход
  def field_init
    # убираем змейку с прошлого хода
    @field.each.with_index do |a, i|
      a.each.with_index do |e, j|
        @field[i][j] = ' ' if ![' ', '$'].include?(e)
      end
    end
    # помещаем в поле хавку если ее там нет
    if @field.flatten.all?{|e| e == ' '}
      y, x = rand(@size), rand(@size)
      @field[y][x] = '$'
    end
    # помещаем змейку в игровое поле
    @snake.segments.each{|segment| @field[segment.y][segment.x] = segment.class.to_s[0]}
  end

  # Для отображения поля в терминале
  def show_field
    @field.map{|a| a.join}#.join('\n')
  end
end
