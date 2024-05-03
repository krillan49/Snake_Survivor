module PlayMods

  # Игра в терминале
  def terminal(snake_length=15)
    g = Game.new(snake_length)

    g.field_init
    pp g.show_field

    loop do
      puts 'Add sgment? (y)'
      a_s = gets.strip
      a_s == 'y' || a_s == 'Y' ? g.snake.add_new_segment : break
    end

    loop do
      puts 'move? (up-w / down-s / right-d / left-a)'
      m = gets.strip
      if m == 'w' || m == 'W'
        g.snake.up
      elsif m == 's' || m == 'S'
        g.snake.down
      elsif m == 'd' || m == 'D'
        g.snake.right
      elsif m == 'a' || m == 'A'
        g.snake.left
      else
        break
      end

      puts "\e[H\e[2J" # Хитрый способ очистить экран
      g.field_init
      pp g.show_field
    end
  end

end
