# docker-git2consul
Docker image using git2consul

## Description
Git2consul clones the branch `GIT_BRANCH` from the `GIT_REPO` repository and puts the following to the KV storage in Consul:
- `git2consul` folder contains your json config
- `CONSUL_MOUNTPOINT` folder contains the files/folders from the repository

### Example

Git repository with: `folder/file.extension` translate in Consul as `CONSUL_MOUNTPOINT/folder/file` with the values from your `file.extension`
