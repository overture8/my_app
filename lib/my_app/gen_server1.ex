defmodule MyApp.GenServer1 do
  use GenServer

   def start_link do
    GenServer.start_link(__MODULE__, [], [name: __MODULE__])
  end

  def do_somthing do
    GenServer.call(__MODULE__, :do_something)
  end 
  
  def handle_call(:do_something, _from, state) do
    # timeout because of slow call here.
    result = do_something_slow()
    {:reply, result, state}
  end

  defp do_something_slow do
    MyApp.GenServer2.slow_thing()
  end
end
