defmodule HitCount do
  def start() do
    Agent.start_link(fn -> 0 end)
  end

  def record_hit(_agent = {:ok, pid}) do
    Agent.update(pid, &(&1 + 1))
  end

  def get_count(_agent = {:ok, pid}) do
    Agent.get(pid, & &1)
  end

  def get_count(_agent = {:test, pid}) do
    pid
  end
end
