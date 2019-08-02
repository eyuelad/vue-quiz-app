#!/usr/bin/env sh

# abort on errors
# set -e

# build
npm run build

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

sleep 2s
# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
git push -f https://github.com/eyuelad/vue-quiz-app.git gh-pages

echo ">>> if push failed run this command -> 'git push -f https://github.com/eyuelad/vue-quiz-app.git gh-pages'"

cd ..