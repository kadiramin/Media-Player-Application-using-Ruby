# media_player/media_player.rb

# Load the TrackManager class from the lib directory
require_relative 'lib/track_manager'

puts "--- Ruby Media Player CLI ---"

# Simulate loading data like an AJAX request might do in a web app
puts "\nLoading Track 1 details..."
track1 = MediaPlayer::TrackManager.load_track_details('track_1.txt')

puts "Loading Track 2 details..."
track2 = MediaPlayer::TrackManager.load_track_details('track_2.txt')

# Display the library
puts "\n--- My Library ---"

[track1, track2].each_with_index do |track, index|
  puts "#{index + 1}. \"#{track[:title]}\" by #{track[:artist]}"
end

# Simulate a user selecting a track to view details
puts "\nEnter the track number to preview its description (or 'quit'):"
choice = gets.chomp.to_i

if choice == 1
  selected_track = track1
elsif choice == 2
  selected_track = track2
else
  puts "Invalid selection."
  exit
end

# Preview the description dynamically
puts "\n--- Description Preview ---"
puts "Title: #{selected_track[:title]}"
puts "Artist: #{selected_track[:artist]}"
puts "Cover Art File: #{selected_track[:cover_image]}"
puts "Description: #{selected_track[:description]}"
puts "---------------------------"

