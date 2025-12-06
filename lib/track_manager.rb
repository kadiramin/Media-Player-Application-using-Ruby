# media_player/lib/track_manager.rb

# A module acts as a namespace to organize our code
module MediaPlayer
  class TrackManager
    # Class method to load a track's data from a file
    def self.load_track_details(filename)
      filepath = File.join(__dir__, '..', 'data', filename) # Construct the correct path
      details = {} # Use a hash to store key-value pairs

      if File.exist?(filepath)
        File.readlines(filepath).each do |line|
          # Split each line by the first colon
          key, value = line.chomp.split(': ', 2)
          details[key.downcase.to_sym] = value if key && value
        end
      else
        puts "Error: File not found at #{filepath}"
      end

      details
    end
  end
end

