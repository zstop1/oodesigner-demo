namespace: io.cloudslang
flow:
  name: add_num
  inputs:
    - first_num: '10'
    - second_num: '10'
  workflow:
    - add_numbers:
        do:
          io.cloudslang.base.math.add_numbers:
            - value1: '${first_num}'
            - value2: '${second_num}'
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
        x: 461.8923645019531
        'y': 143.41665649414062
        navigate:
          c96a1878-dc8f-c949-f2b2-b6cc7010274d:
            targetId: f7c3575b-330d-7189-4631-485e4be690ec
            port: SUCCESS
    results:
      SUCCESS:
        f7c3575b-330d-7189-4631-485e4be690ec:
          x: 795.111083984375
          'y': 137.67015075683594
