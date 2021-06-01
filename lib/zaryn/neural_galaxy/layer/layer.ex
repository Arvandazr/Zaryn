defmodule Zaryn.NeuralGalaxy.Layer do

  alias Zaryn.NeuralGalaxy.Neuron

  defstruct pid: nil, neurons: []



  def get(pid), do: Agent.get(pid, & &1)

  defp create_neurons(nil), do: []
  defp create_neurons(size) when size < 1, do: []

  def build(number_of_neurons, number_of_weights) do
    neurons = for _ <- 1..number_of_neurons do
      weights = for _ <- 1..number_of_weights, do: 1
      Neuron.build(weights)
    end

    %Zaryn.NeuralGalaxy.Layer{neurons: neurons}
  end

  def build(number_of_neurons, number_of_weights, :random) do
    neurons = for _ <- 1..number_of_neurons do
      weights = for _ <- 1..number_of_weights, do: 2 * :rand.uniform - 1
      Neuron.build(weights)
    end

    %Zaryn.NeuralGalaxy.Layer{neurons: neurons}
  end

  defp create_neurons(size) when size > 0 do
    Enum.into(1..size, [], fn _ ->
      {:ok, pid} = Neuron.start_link()
      pid
    end)
  end
end
