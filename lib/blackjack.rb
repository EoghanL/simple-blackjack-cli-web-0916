def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(num)
  puts "Your cards add up to #{num}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  input = gets.chomp
end

def end_game(total)
  puts "Sorry, you hit #{total}. Thanks for playing!"
end

def initial_round(array = [])
  2.times { array << deal_card }
  card_total = 0
  array.each { |card| card_total += card }
  display_card_total(card_total)
  card_total
end

def hit?(int)
  prompt_user
  input = get_user_input
  card_total = int
  unless(input == "h" || input == "s")
    invalid_command
    prompt_user
  end
  input == "h" ? card_total += deal_card : nil
  card_total

end

def invalid_command
  puts "Please enter a valid command."
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  card_arr = []
  card_total = 0
  welcome
  initial_round(card_arr)
  card_arr.each{ |x| card_total += x }
  until(card_total > 21)

    card_total = hit?(card_total)
    display_card_total(card_total)

  end
  end_game(card_total)

end
