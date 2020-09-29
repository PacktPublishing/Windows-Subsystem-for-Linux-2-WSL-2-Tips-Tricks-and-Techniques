# Working with git

To view git history in the terminal:

```bash
git log --graph --oneline --decorate --all
```

To set up an alias:

```bash
git config --global --replace-all alias.logtree 'log --graph --oneline --decorate --all'
# Now run `git logtree`
```

