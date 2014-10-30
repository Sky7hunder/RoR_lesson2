class Pet

  def initialize

    puts 'Pet\'s name: '
    @name = gets.chomp #имя
    @hp = 100 #уровень здоровья
    @lvl = 1 #уровень петомца
    @mood = 100 #настроение
    @hungry = 0 #голод
    @sleep = 100 #сон
    @hygiene = 100 #гигиена
    @mana = 100 #мана
    @time = Time.now
    timer

  end

  def help

    timer
    rand_method

    #не пойму как заменить это повторение if..else 

    if @hp > 100
      @hp = 100
    end

    if @hungry > 100
      @hungry = 100
    elsif @hungry < 0
      @hungry = 0
    end

    if @sleep > 100
      @sleep = 100
    elsif @sleep < 0
      @sleep = 0
    end

    if @mana > 100
      @mana = 100
    elsif @mana < 0
      @mana = 0
    end

    if @mood > 100
      @mood = 100
    elsif @mood < 0
      @mood = 0
    end

    puts "Name: #{@name}", "Level: #{@lvl.to_i}", "Health #{@hp}", "Mood: #{@mood}", "Hungry: #{@hungry}", "Sleep: #{@sleep}", "Hygiene: #{@hygiene}",
         "Mana: #{@mana}"

  end

  def fight

    timer
    puts 'Your pet are fighting...wait'
    sleep(2)
    result = rand(0..1)
    if result == 0
      puts 'Your pet was lose'
      @hp = @hp - rand(5..15)
      @lvl = @lvl + rand(0.25..0.5)
      @mana = @mana - rand(15..30)
    else
      puts 'Your pet was win'
      @hp = @hp - rand(2..10)
      @lvl = @lvl + rand(0.5..1)
      @mana = @mana - rand(15..30)
    end

  end

  def feed
    timer
    puts 'Pet is eating now....Nom Nom nom..'
    sleep(2)
    @hungry = @hungry - 10
    @sleep = @sleep - 5
  end

  def walk
    timer
    puts 'Your pet is walking now...'
    sleep(2)
    @mood = @mood + 10
    @hygiene = @hygiene - 5
  end

  def play
    timer
    puts 'Your pet is playing now...'
    sleep(2)
    @mood = @mood + 10
    @sleep = @sleep - 5
  end

  def punish
    timer
    puts 'You punishing your pet...'
    sleep(2)
    @mood = @mood - 20
  end

  def wash
    timer
    puts 'You washing your pet...'
    sleep(2)
    @hygiene = @hygiene + 10
  end

  def teach
    timer
    puts 'You teach your pet...'
    sleep(2)
    @lvl = @lvl + 1
  end

  def sleeping
    timer
    puts 'Your pet sleeping now...'
    sleep(2)
    @sleep = @sleep + 100
  end

  def flask_with_mana
    timer
    puts 'Your pet drinking flask...'
    sleep(2)
    @mana = @mana + 50
  end

  def heal
    timer
    puts 'Healing your pet...'
    sleep(2)
    @hp = @hp + 30
  end

  # check your pet on death or alive

  def check_death?
    return true if @hp <= 0
  end

  private

  def rand_method
    send(["feed", "heal", "sleeping"].sample)
  end

  # changing your pet stats on time

  def timer

    time_now = Time.now
    if time_now > (@time + 60)
      difference = time_now - @time
      factor = difference.to_i / 60

      # increase hungry

      if (0..100).cover?(@hungry)
        @hungry = @hungry + (rand(2..4) * factor.to_i)
      end

      # increase the desire to sleep

      if (0..100).cover?(@sleep)
        @sleep = @sleep - (rand(1..4) * factor.to_i)
      end

      # recovery mana

      if (0..100).cover?(@mana)
        @mana = @mana + (rand(3..6) * factor.to_i)
      end

      #rewrite time

      @time = Time.new

    end
  end

end

pet = Pet.new
input = 0

until input == 'exit' || pet.check_death?
  puts 'If you type: 1 - Pet status; 2 - Your pet fight with another; 3 - Feed your pet; 4 - Walk with your pet;
 5 - Your pet drink a flask with mana; 6 - Play with your pet; 7 - Punish pet; 8 - Teach pet; 9 - Wash pet; 10 - Pet will sleep.'
  input = gets.chomp
  case input.to_i
    when 1
      pet.help
    when 2
      pet.fight
    when 3
      pet.feed
    when 4
      pet.walk
    when 5
      pet.flask_with_mana
    when 6
      pet.play
    when 7
      pet.punish
    when 8
      pet.teach
    when 9
      pet.wash
    when 10
      pet.sleeping
    when 11
      pet.heal
  end
end

if pet.check_death? == true
  puts '_______________________'
  puts 'Your pet was died...X_x'
end