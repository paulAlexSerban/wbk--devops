# Declarative Kubernetes
- we doe not know the state, we know the end result
- example: `kubectl apply -f deployment.yaml`
  - we do not know the current state
  - we only know what we want the end result to be (yaml contents)
- same command each time (with tiny exceptions for delete)
- resources can be all in a file, or many files (apply a who dir)
- requires understanding the YAML keys and values
- more work than `kubectl run` for just a starting pod
- the easiest way to automate Kubernetes
- this is the eventual path to GitOps happiness