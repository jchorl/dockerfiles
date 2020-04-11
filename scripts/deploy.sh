set -e

echo "$2" | docker login -u "$1" --password-stdin

for img in $(docker images --format '{{.Repository}}:{{.Tag}}' | grep $1); do
  docker push $img
done
