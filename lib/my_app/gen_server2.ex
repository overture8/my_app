defmodule MyApp.GenServer2 do
  use GenServer

   def start_link do
    GenServer.start_link(__MODULE__, [], [name: __MODULE__])
  end

  def slow_thing do
    GenServer.call(__MODULE__, :slow_thing)
  end 

  def handle_call(:slow_thing, _from, state) do
    :timer.sleep(10000)
    {:reply, "Some return value", state}
  end
end
