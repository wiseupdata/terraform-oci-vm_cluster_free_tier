#Deploy on click
git add . && git commit -am "sync" && git push && git tag 0.0.3 -f && git push --tags -f


# Create the branch and tag
git checkout -b 0.0.3 && git push --set-upstream origin 0.0.3


# Rename project locally
# git remote set-url origin git@github.com:wiseupdata/terraform-oci-ClusterFreeTier.git