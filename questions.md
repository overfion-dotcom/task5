```python
locals {
  bucket_name = "${var.project_name}-tfstate"
}
# using variables in backend block work only with openTofu
```

1. Is there better way to set up names/variables in backend block ?
2. Is it possible to automate bootstraping process ?
3. Is there any point in having more power for bastion ?
