

require_relative 'lib/track_manager'


def display_track_details(track)
  details = "\n--- Description Preview ---\n"
  details << "Title: #{track[:title]}\n"
  details << "Artist: #{track[:artist]}\n"
  details << "Cover Art File: #{track[:cover_image]}\n"
  details << "Description: #{track[:description]}\n"
  details << "---------------------------"
  puts details
end

puts "--- Ruby Media Player CLI ---"

tracks = []


print "\nLoading Track 1 details..."
tracks << MediaPlayer::TrackManager.load_track_details('track_1.txt')
puts " Done."

print "Loading Track 2 details..."
tracks << MediaPlayer::TrackManager.load_track_details('track_2.txt')
puts " Done."


puts "\n--- My Library ---"
tracks.each_with_index do |track, index|
  puts "#{index + 1}. \"#{track[:title]}\" by #{track[:artist]}"
end


print "\nEnter the track number to preview its description (or 'quit'): "
choice = gets.chomp.to_i

index = choice - 1
selected_track = tracks[index]

if selected_track.nil?
  abort("Invalid selection.")
end


display_track_details(selected_track)
