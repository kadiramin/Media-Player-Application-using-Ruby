# media_player/media_player.rb

# Load the TrackManager class from the lib directory
require_relative 'lib/track_manager'

# Define a helper method for displaying details
def display_track_details(track)
  puts "\n--- Description Preview ---"
  puts "Title: #{track[:title]}"
  puts "Artist: #{track[:artist]}"
  # Use string interpolation for cleaner output
  puts "Cover Art File: #{track[:cover_image]}"
  puts "Description: #{track[:description]}"
  puts "---------------------------"
end

puts "--- Ruby Media Player CLI ---"

tracks = []

# Use an array to store tracks, making the code scalable
puts "\nLoading Track 1 details..."
tracks << MediaPlayer::TrackManager.load_track_details('track_1.txt')

puts "Loading Track 2 details..."
tracks << MediaPlayer::TrackManager.load_track_details('track_2.txt')

# Display the library using the new array
puts "\n--- My Library ---"
tracks.each_with_index do |track, index|
  puts "#{index + 1}. \"#{track[:title]}\" by #{track[:artist]}"
end

# Simulate a user selecting a track to view details
puts "\nEnter the track number to preview its description (or 'quit'):"
choice = gets.chomp.to_i

# Validate choice using array access
index = choice - 1
selected_track = tracks[index]

if selected_track.nil?
  # Use abort instead of exit for cleaner error termination in CLI tools
  abort("Invalid selection.")
end

# Preview the description dynamically using the new helper method
display_track_details(selected_track)
