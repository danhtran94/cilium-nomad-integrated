#!/usr/bin/env bash

# start nomad server
nomad agent -config=nomad-config.hcl

# list nomad nodes
nomad server-members

# plan nomad jobs
nomad plan example-job.hcl
nomad run example-job.hcl

# ==> Monitoring evaluation "1e729627"
#     Evaluation triggered by job "nomad-redis"
#     Allocation "bf3fc4b2" created: node "b0d927cd", group "cache"
#     Evaluation status changed: "pending" -> "complete"
# ==> Evaluation "1e729627" finished with status "complete"

# inspect Allocated job
nomad alloc-status bf3fc4b2
