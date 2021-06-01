defmodule Zaryn.NeuralGalaxy.Network do

  defstruct [
    learning_rate: nil,
    input_nodes: nil,
    hidden_nodes: nil,
    output_nodes: nil,
    weights: nil,
    error_rate: nil,
    target: nil,
  ]

  def create(
    input_nodes,
    hidden_nodes,
    output_nodes,
    learning_rate \\ 1.0) when is_number(input_nodes)
                          and  is_number(hidden_nodes)
                          and  is_number(output_nodes)
                          and  is_float(learning_rate) do

    Agent.start_link(fn() ->
      %Zaryn.NeuralGalaxy.Network{
        learning_rate: learning_rate,
        input_nodes: input_nodes,
        hidden_nodes: hidden_nodes,
        output_nodes: output_nodes,
      }
      end, [name: __MODULE__])
  end

  @doc """
  Trains the Neural network toward the specified target.
  # PARAMETERS
  - `inputs`: The inputs to the neural network. List.T()
  - `target`: The goal for the network to acheive. List.T()
  """


  @doc """
  Get state of neural network
  """
  def get do
    Agent.get(__MODULE__, &(&1))
  end
end
