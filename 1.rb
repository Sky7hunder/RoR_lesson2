class Magic_ball

  def initialize
    puts 'Enter your question, and then magic ball will a prediction for you'
    question = gets.chomp
    @answers = ['yes', 'no', 'of course', 'absolutely', 'question is not clear', 'bla', 'bla bla', 'abra cadabra', 'avada cedavra',
               'vingardium leviossa', 'vse budet horosho', 'ne povezlo', 'moi soboleznovaniya', 'vozmogno', 'kak to tak', 'ne parsya',
               'luchshe ne pridumaesh', 'yes no meyby', 'idiot', 'Spooky']
  end

  def answer
    puts @answers[@index]
  end

  def shake
    @index = rand(@answers.length)
    self
  end

end

magic_ball = Magic_ball.new
puts 'Hmmmmm......'
sleep(3)
magic_ball.shake.answer