==============================
                         Between Main Branch and Master Branch in Github?  
==============================

                    git branch -m master main \
git push -u origin main \
git remote set-head origin main
They just changed the default branch for new repositories. You can also set it back to master here -> https://github.com/settings/repositories


The main branch has already replaced all new github repos as the main branch. You can read up on it here. There is no actual difference between main and master, it's just the name of the default branch.

For you git push origin master just creates a new branch called master (since it doesn't exist already) and pushes your current commits there.
  
==============================
349 at  2021-10-29T15:22:52.000Z
==============================
