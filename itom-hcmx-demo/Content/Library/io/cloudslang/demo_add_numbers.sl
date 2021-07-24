namespace: io.cloudslang
flow:
  name: demo_add_numbers
  inputs:
    - number1: '100'
    - number2: '100'
  workflow:
    - add_numbers:
        do:
          io.cloudslang.base.math.add_numbers:
            - value1: '${number1}'
            - value2: '${number2}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      add_numbers:
        x: 417
        'y': 120
        navigate:
          db1e6481-3ffb-064f-d411-a04155e24665:
            targetId: 1a224a54-54ce-4859-3b6b-bfe0c0a747cd
            port: SUCCESS
    results:
      SUCCESS:
        1a224a54-54ce-4859-3b6b-bfe0c0a747cd:
          x: 722
          'y': 125
