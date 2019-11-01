job_one:
  schedule.present:
    - function: test.version
    - seconds: 10
    - returner: rawfile_json
