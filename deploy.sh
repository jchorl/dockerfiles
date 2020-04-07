set -e

echo "$2" | docker login -u "$1" --password-stdin

docker images --format '{{.Repository}}:{{.Tag}}' | grep $1 | xargs docker push
