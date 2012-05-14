module APN
  module BeforeUnregisterSupport
    def before_unregister_worker(&block)
      block ? (@before_unregister_worker = block) : @before_unregister_worker
    end

    def before_unregister_worker=(before_unregister_worker)
      @before_unregister_worker = before_unregister_worker
    end
  end
end

# Add this module to the base Resque class
Resque.send(:extend, APN::BeforeUnregisterSupport)
