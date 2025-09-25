# Git utilities

## squash_merge.bash

This is a generic bash script to help you perform a squash merge from a development branch into a main branch in any Git repository.

---

### Features

- Shows `git status` for both branches before merging.
- Prompts for confirmation before proceeding with the squash merge.
- Performs a squash merge of the development branch into the main branch.
- Commits the squash merge with a user-provided commit message.
- Returns to the development branch and original directory after the operation.

---

### Usage

If arguments *main_branch* and *dev_branch* are not passed, they will default to *main* and *dev*, respectively

```bash
./squash_merge.sh "Commit message" [main_branch] [dev_branch]
```
