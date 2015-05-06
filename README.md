# backend-boilerplate-node


# get a pg image, and build ours from the dockerfile
docker pull postgres
docker build -t misrab/node .

# start the pg container, then link our app to it
# remove -d from second command if you like; remove --name app if you like
docker run --name some-postgres  -d postgres
docker run --name app --link some-postgres:postgres -d misrab/node
# other way: docker run --link some-postgres:postgres misrab/node


# for interactive testing
# docker run -t -i  misrab/node /bin/bash