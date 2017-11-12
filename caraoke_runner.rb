require("pry")
require_relative("./bar_tab.rb")

require_relative("./room.rb")
require_relative("./guest.rb")
require_relative("./song.rb")

@bartab = BarTab.new
@room1 = Room.new("main")
@room2 = Room.new("80s")
@bartab.add_room_to_bar_tab(@room1)
@bartab.add_room_to_bar_tab(@room2)

def create_song
  puts "What is the title of the song?"
  title = gets.chomp
  puts "Who is the artist who sang that song?"
  artist = gets.chomp
  return Song.new(title, artist)
end

def show_rooms
  puts "There is a choice of:"
  puts "-"*10
  for room in @bartab.rooms
    puts room.name
  end
  puts "-"*10
end

def check_in_guest_menu
  puts "What is the name of the guest?"
  name = gets.chomp
  guest = Guest.new(name)
  puts "Do they have a favourite song? (y/n)"
  fav_answer = gets.chomp.downcase
  if fav_answer == "y"
    fav_song = create_song()
    guest.favourite_song = fav_song
  end
  puts "Do they have a worst song? (y/n)"
  worst_answer = gets.chomp.downcase
  if worst_answer == "y"
    worst_song = create_song()
    guest.worst_song = worst_song
  end

  puts "Which room would you like to go to?"
  show_rooms
  room1 = gets.chomp
  for room in @bartab.rooms
    if room.name == room1
      puts "\n#{guest.name} just checked in to the #{room1} room"
      room.check_in_guest(guest)
    end
  end
  end_function
  return nil
end

def add_song_func
  song_to_add = create_song
  puts "Which room would you like to add it to?"
  show_rooms
  room1 = gets.chomp
  for room in @bartab.rooms

    if room.name == room1
      room.add_song(song_to_add)
      puts "\n#{song_to_add.title} by #{song_to_add.artist} was added to the #{room.name} room"
    end
  end
  end_function
  return nil
end

def end_function
  puts "\n*** press enter to continue ***"
  gets.chomp
end

def show_guests

  puts "For which room would you like to view the guests?"
  show_rooms
  room_choice = gets.chomp
  puts "\n"
  for room in @bartab.rooms
    if room.name == room_choice
      for guest in room.guests
        puts "#{guest.name} is in the #{room.name} room"
      end

    end
  end
  end_function
  return nil
end

def show_songs

  puts "For which room would you like to view the songs?"
  show_rooms
  room_choice = gets.chomp
  puts "\n"
  for room in @bartab.rooms
    if room.name == room_choice
      for song in room.songs
        puts "#{song.title} by #{song.artist} is on the playlist in the #{room.name} room"
      end

    end
  end
  end_function
  return nil
end

def main_menu
  puts `clear`
  puts "Welcome to CodeClan Caraoke"
  puts "What would you like to do?"
  puts "Press 'c' to check in a guest to a room"
  puts "Press 's' to add a song to a room"
  puts "Press 'g' to view the guests in a room"
  puts "Press 'l' to view the songs in a room"
  puts "Press 'e' to exit \n"
  get_choice
end

def get_choice
  @choice = gets.chomp.downcase
  case @choice
  when'r'
    for room in @bartab.rooms
      room.name
    end
  when 'c'
    check_in_guest_menu
  when 's'
    add_song_func
  when 'g'
    show_guests
  when 'e'
  when 'l'
    show_songs
  else
    puts "That wasn't one of the options"
    end_function
  end


end

choice = nil
until @choice == 'e'
  puts main_menu
end

puts "£#{@bartab.count_money} is the amount of money held by the caraoke bar"
