namespace: Integrations.AOS_application
flow:
  name: deploy_aos
  inputs:
    - target_host: 172.16.239.129
    - target_host_username
    - target_host_username: root
    - target_host_password:
        default: Cloud_1234
        sensitive: true
  workflow:
    - install_postgres:
        do:
          Integrations.demo.aos.software.install_postgres:
            - username: '${target_host_username}'
            - password:
                value: '${target_host_password}'
                sensitive: true
            - tomcat_host: '${target_host}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: install_java
    - install_java:
        do:
          Integrations.demo.aos.software.install_java:
            - username: '${target_host_username}'
            - password:
                value: '${target_host_password}'
                sensitive: true
            - tomcat_host: '${target_host}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: install_tomcat
    - install_tomcat:
        do:
          Integrations.demo.aos.software.install_tomcat:
            - username: '${target_host_username}'
            - password:
                value: '${target_host_password}'
                sensitive: true
            - tomcat_host: '${target_host}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: install_aos_application
    - install_aos_application:
        do:
          Integrations.demo.aos.application.install_aos_application:
            - username: '${target_host_username}'
            - password:
                value: '${target_host_password}'
                sensitive: true
            - tomcat_host: '${target_host}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      install_postgres:
        x: 56
        'y': 153
      install_java:
        x: 278
        'y': 141
      install_tomcat:
        x: 449
        'y': 30
      install_aos_application:
        x: 653
        'y': 122
        navigate:
          761aac5b-bbdc-6fc4-a222-e33db9f94492:
            targetId: 8bc42c2a-8c74-6231-9a12-9bb1588c3402
            port: SUCCESS
    results:
      SUCCESS:
        8bc42c2a-8c74-6231-9a12-9bb1588c3402:
          x: 818.9943237304688
          'y': 147.55113220214844
