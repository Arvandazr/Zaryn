defmodule Zaryn.NeuralGalaxy.Neuron do
  use GenServer
  require Logger

  alias Zaryn.NeuralGalaxy.Activation

  defstruct pid: nil,
            id: nil,
            accumulator: nil,
            input: 0,
            output: 0,
            incoming: [],
            outgoing: []



  def update(pid, neuron_fields) do
    Agent.update(pid, &Map.merge(&1, neuron_fields))
  end

  def get(pid), do: Agent.get(pid, & &1)

  def connect(source_neuron_pid, target_neuron_pid) do
    {:ok, connection_pid} = Connection.connection_for(source_neuron_pid, target_neuron_pid)

    source_neuron_pid
    |> update(%{outgoing: get(source_neuron_pid).outgoing ++ [connection_pid]})

    target_neuron_pid
    |> update(%{incoming: get(target_neuron_pid).incoming ++ [connection_pid]})
  end

  defp sumf do
    fn connection_pid, sum ->
      connection = Connection.get(connection_pid)
      sum + get(connection.source_pid).output * connection.weight
    end
  end

  def activate(neuron_pid, activation, value \\ nil) do
    neuron = get(neuron_pid)

    fields =
      if neuron.bias? do
        %{output: 1}
      else
        input = value || Enum.reduce(neuron.incoming, 0, sumf())
        %{input: input, output: Activation.calculate_output(activation, input)}
      end
    neuron_pid |> update(fields)
  end
end
