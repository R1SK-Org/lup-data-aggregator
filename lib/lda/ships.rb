module LDA
  class Ships
    @ship_files  = Dir.glob('data/ships/**/*.json').select { |e| File.file? e }
    @video_files = Dir.glob('data/videos/**/*.json').select { |e| File.file? e }

    class << self
      attr_accessor :ship_files, :video_files

      def list
        ships_array = []
        videos      = JSON.parse(File.read(video_files.first)) # TODO: What if we have more files?

        ship_files.each do |file|
          raw  = File.read(file)
          ship = JSON.parse(raw)

          ship.values.first["bulkheads"].each do |bh|
            bh["thermres"] = 0.0 if bh["thermres"] == 0
          end

          ship.values.first["defaults"]["internal"].each_with_index do |item, index|
            ship.values.first["defaults"]["internal"][index] = item.to_s
          end

          ship.values.first["slots"]["internal"] = [0]


          ship.values.first["defaults"]["hardpoints"].each_with_index do |item, index|
            ship.values.first["defaults"]["hardpoints"][index] = item.to_s
          end

          if videos.keys.include?(ship.keys.first)
            ship.values.first["properties"]["video"] = videos[ship.keys.first]
          end

          # Continue
          ships_array.push ship.values
        end

        { "ships" => ships_array }
      end
    end
  end
end
