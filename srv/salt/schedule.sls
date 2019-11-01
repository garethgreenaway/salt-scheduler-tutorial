job_one:
  schedule.present:
    - function: test.version
    - seconds: 10
