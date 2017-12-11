require 'pry'
require 'colorize'

def menu
  while true
    puts "'Ello guvna, enter a phrase, and I'll tell you which word or words has the most repeated letters in it! (Or just type 'Q' to quit)".yellow

    input = gets.strip
    if input.downcase == 'q'
      puts '¡Adios, amigo!'.green
      exit 0
    end

    repeated_letters(input)
  end
end

def repeated_letters(phrase)
  phrase_array = phrase.split(' ')
  @highest_count = 0
  @index = []

  phrase_array.each_with_index do |word, i|
    word_array = word.split('')
    repeat_counter = 0
    letter_checker = ''
    local_highest = 0

    word_array.each do |letter|
      if letter == letter_checker
        local_highest += 1
      else
        repeat_counter = local_highest if local_highest > repeat_counter
        local_highest = 0
      end
      letter_checker = letter
    end

    if repeat_counter > @highest_count
      @highest_count = repeat_counter
      @index = []
      @index << i
    elsif repeat_counter == @highest_count
      @index << i
    end
  end

  if @highest_count == 0
    puts "These are all boring words with just single letters. Psh.".red
  elsif @index.length == 1
    puts "Alrighty me bucko, the word with the highest number of letter repeats is #{phrase_array[@index[0]]}, with #{@highest_count + 1} times a letter was repeated. Fun!".cyan
  else
    repeat_array = []
    @index.each do |i|
      repeat_array << phrase_array[i]
    end
    repeated_words = repeat_array.join(', and ')
    puts "Hoo boy, we got multiple words with repeats! Those are #{repeated_words}, with #{@highest_count + 1} repeats each!".cyan
  end

  menu
end

menu
