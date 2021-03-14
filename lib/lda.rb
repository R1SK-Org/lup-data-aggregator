module LDA

  class << self
    def ingest!
      Ships.list["ships"].each_with_index do |ship, i|

        # Logger.info("index: \"ships\", id: #{i}, body: #{ship}")
        Elasticsearch.index(index: "ships", id: i, body: ship.first)
      end

      return true
    end
  end

  require 'json'
  require_relative 'lda/logger'
  require_relative 'lda/ships'
  require_relative 'lda/elasticsearch'
end
