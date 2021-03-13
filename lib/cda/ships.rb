module CDA
  class Ships
    SHIP_FILES = Dir.glob('data/ships/**/*.json').select { |e| File.file? e }

    def self.list
      ships_array = []

      SHIP_FILES.each do |file|
        raw  = File.read(file)
        ship = JSON.parse(raw)

        ships_array.push ship
      end

      { "ships" => ships_array }
    end
  end
end
