class Guessing_Game
  def initialize
    random
  end

  def random
    @random =rand 1..20
  end

  def start
    self.empty
    print 'Do you want to play my guessing game? : '
    self.answer
    self.if_answer
  end

  def guess_number
    print 'Pick a number between 1 and 20 : '
    @test = gets.chomp.to_i
    if (1..20).include?(@test)
      if @list.include?(@test)
        puts 'You already guess that number'
        guess_number
      else
        @list.push(@test)
        @guess = @test
      end
    else
      puts 'Thats not between 1 and 20'
      guess_number
    end
  end

  def answer
    @answer = gets.chomp.downcase
  end

  def empty
    @yes = ''
    @list = []
  end

  def yes
    @yes = 'yes'
  end

  def if_answer
    if @answer == 'yes'
      self.yes
    elsif @answer =='no'
      puts 'Thats to bad'
      exit
    else
      puts "thats not an answer"
      self.start
    end
  end

  def start_difficulty
    while @yes == 'yes'
      self.empty
      self.difficulty
      self.level
      self.number_of_tries
      self.loop
    end
  end

  def loop
    self.guess_number
    self.correct_or_not
  end

  def level
    @level = gets.chomp.to_i
    if @level == 1
      @tries = 5
    elsif  @level == 2
      @tries = 4
    elsif @level == 3
      @tries = 3
    else
      puts 'Thats not an answer'
      @yes = 'yes'
    end
  end

  def difficulty
    print 'Do you want to play easy(1), medium(2), or HARD(3) : '
  end

  def number_of_tries
    puts "You have #{@tries} tries."
  end

  def correct
    puts 'Congratulation you got it correct'
    print 'Do you want to play again? : '
  end

  def correct_or_not
    if @guess == @random
      self.correct
      self.random
      self.answer
      self.if_answer
    elsif @guess != @random
      @tries =@tries - 1
      if @tries > 0
        puts "That is incorrect you have #{@tries} tries left."
        if @guess > @random
          puts "You were to high"
        elsif @guess < @random
          puts "You were to low"
        end
        self.loop
      elsif @tries == 0
        puts "Game over the correct number was #{@random}"
        print "Do you want to play again : "
        self.random
        self.answer
        self.if_answer
      end
    end
  end
end

play = Guessing_Game.new

play.empty

play.start

play.start_difficulty
