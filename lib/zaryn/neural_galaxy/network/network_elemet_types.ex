defmodule Zaryn.NeuralGalaxy.Network.NetworkElementTypes do
  require Record
Record.defrecord(:sensor,
  id: Tuple,
  cortex_id: Tuple,
  type: Atom,
  vector_length: Integer,
  neuron_ids: List,
  scape: Atom
)

Record.defrecord(:actuator,
    id: Tuple,
    cortex_id: Tuple,
    type: Atom,
    vector_length: Integer,
    neuron_ids: List,
    scape: Atom
  )

  Record.defrecord(:neuron,
    id: Tuple,
    generation: Integer,
    cortex_id: Tuple,
    activation_function: Fun,
    input_weights: List,
    output_ids: List,
    recurrent_ids: List
  )

  Record.defrecord(:cortex,
    id: Tuple,
    agent_id: Tuple,
    sensor_ids: List,
    actuator_ids: List
  )

  Record.defrecord(:agent,
    id: Tuple,
    generation: Integer,
    population_id: Tuple,
    specie_id: Tuple,
    cortex_id: Tuple,
    fingerprint: Atom,
    constraint: Atom,
    history: List,
    fitness: Float,
    innovation_factor: Float,
    pattern: List
  )

  Record.defrecord(:population,
    id: Tuple,
    polis_id: Tuple,
    specie_ids: List,
    morphologies: List,
    innovation_factor: Float
  )

  Record.defrecord(:specie,
    id: Tuple,
    population_id: Tuple,
    fingerprint: Atom,
    constraint: Atom,
    agent_ids: List,
    champion_ids: List,
    average_fitness: Float,
    innovation_factor: Float
  )
end
