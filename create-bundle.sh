# API
echo "UPDATE API"
cd  api/
git pull
TAG_API=`git tag -l --sort v:refname | tail -1`
echo $TAG_API
git reset --hard $TAG_API
cd ..

# Builder-python
echo "UPDATE BUILDER PYTHON"
cd  builder-python/
git pull
TAG_BUILDER_PYTHON=`git tag -l --sort v:refname | tail -1`
echo $TAG_BUILDER_PYTHON
git reset --hard $TAG_BUILDER_PYTHON
cd ..

# Client
echo "UPDATE CLIENT"
cd  client/
git pull
TAG_CLIENT=`git tag -l --sort v:refname | tail -1`
echo $TAG_CLIENT
git reset --hard $TAG_CLIENT
cd ..

# Database
echo "UPDATE DATABASE"
cd  database/
git pull
TAG_DATABASE=`git tag -l --sort v:refname | tail -1`
echo $TAG_DATABASE
git reset --hard $TAG_DATABASE
cd ..

# Monitor
echo "UPDATE MONITOR"
cd  monitor/
git pull
TAG_MONITOR=`git tag -l --sort v:refname | tail -1`
echo $TAG_MONITOR
git reset --hard $TAG_MONITOR
cd ..

# Docker
echo "UPDATE DOCKER"
cd docker
git pull
git checkout main
sed -i -e "s/gpao\/database:*.*.*/gpao\/database:$TAG_DATABASE/g" docker-compose.yml
sed -i -e "s/gpao\/api-gpao:*.*.*/gpao\/api-gpao:$TAG_API/g" docker-compose.yml
sed -i -e "s/gpao\/monitor-gpao:*.*.*/gpao\/monitor-gpao:$TAG_MONITOR/g" docker-compose.yml
sed -i -e "s/gpao\/client-gpao:*.*.*/gpao\/client-gpao:$TAG_CLIENT/g" docker-compose.yml

git commit -am "Change version docker-compose.yml" && git push
cd ..