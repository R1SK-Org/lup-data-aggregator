# Ruby can be so cool sometimes
require 'logger'
require 'forwardable'

# Me likes having Logger.whatever, so no instancing elsewhere, only class methods.
module LDA
  class Logger

    if ENV.fetch("LDA_ENV") == "development"
      @log       = ::Logger.new(STDOUT)
      @log.level = ::Logger::DEBUG
    else
      @log       = ::Logger.new('logs/lda.log')
      @log.level = ::Logger::WARN
    end

    class << self
      extend Forwardable

      attr_accessor :log

      def_delegators :log,
        :debug,
        :info,
        :warn,
        :error

    end
  end
end
