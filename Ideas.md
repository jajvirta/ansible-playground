


health check task/role:

    include: health_check.yml address=http://localhost/eval/status


    tasks:
      - name: test output
        command: uri url={{ address }}
        register: health

      - name: check health status
        fail: "nasse-setä on hyvin vihainen!i {{ address }}"
        when: "'ok' not in health.stdout"
          

