# Adding a +before_unregister_worker+ hook Resque::Worker. To be used, must be matched by a similar monkeypatch
# for Resque class itself, or else a class that extends Resque. See apple_push_notification/queue_manager.rb for 
# an implementation.
module Resque
  class Worker
    alias_method :unregister_worker_without_before_hook, :unregister_worker

    # Wrapper for original unregister_worker method which adds a before hook +before_unregister_worker+
    # to be executed if present.
    def unregister_worker
      run_hook(:before_unregister_worker, self) 
      unregister_worker_without_before_hook
    end
  end
end
