require "pp"
class Timer
  def initialize(clock: Time)
    @clock = clock
  end

  def elapsed
    return 0 unless @started # !> instance variable @started not initialized
    ((@clock.now - @start_time) * 1000).to_i
  end

  def start
    @start_time = @clock.now
    @started = true
  end

  def started?
    @started ||= false
  end
end
