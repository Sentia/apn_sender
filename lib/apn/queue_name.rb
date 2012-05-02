module APN
  class Config
    class << self
      attr_accessor :queue_name

      def queue_name_with_blank_check
        queue_name_without_blank_check || raise("APN: No queue name set, please set APN::Config.queue_name in an initializer")
      end

      alias_method :queue_name_without_blank_check, :queue_name
      alias_method :queue_name, :queue_name_with_blank_check
    end
  end
end
