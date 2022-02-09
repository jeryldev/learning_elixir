defmodule Procs do
  def hello(count) do
    receive do
      {:crash, reason} ->
        exit(reason)

      {:quit} ->
        IO.puts("Exit")

      {:add, n} ->
        hello(count + n)

      msg ->
        IO.puts("Hello #{count} #{inspect(msg)}")
        hello(count)
    end
  end

  def greeter(what_to_say) do
    receive do
      msg -> IO.puts("#{what_to_say}: #{msg}")
    end

    greeter(what_to_say)
  end

  def greeting(count) do
    receive do
      {:reset} ->
        IO.puts("Resetting to zero")
        greeting(0)

      {:add, n} ->
        IO.puts("Hello #{count} + #{n}")
        greeting(count + n)
    end
  end
end
