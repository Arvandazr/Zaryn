defmodule Zaryn.NeuralGalaxy.Neuron.Sensor do
  use GenServer

  defmodule State do
    defstruct neuron: nil,
              env: nil
  end

  def start_link(neuron, env) do
    GenServer.start_link(__MODULE__, %State{neuron: neuron, env: env})
  end

  def init(state) do
    {:ok, state}
  end

  def sync(pid) do
    GenServer.cast(pid, :sync)
  end

  def handle_cast(:sync, %{neuron: neuron, env: env} = state) do
    input = GenServer.call(env, :sense)

    GenServer.cast(neuron, {:forward, input})

    {:noreply, state}
  end
end
