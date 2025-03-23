#Deploy on click
git add . && git commit -am "sync" && git push && git tag 0.0.2 -f && git push --tags -f


# Create the branch and tag
git checkout -b v0.0.2 && git push --set-upstream origin v0.0.2


# Rename project locally
# git remote set-url origin git@github.com:wiseupdata/vm_cluster_free_tier.git 