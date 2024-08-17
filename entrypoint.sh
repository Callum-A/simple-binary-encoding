#!/bin/bash
OUTPUT_DIR=$1
NAMESPACE=$2
shift
shift
ARGS=""

for f in $@ ;
do
  ARGS="$ARGS$f "
done
ARGS=`echo $ARGS | xargs`

echo "Output: $OUTPUT_DIR"
echo "Namespace: $NAMESPACE"
echo "Schema Files: $@"

./gradlew generateRustBindings --args="$ARGS" -PoutputDir=$OUTPUT_DIR -Pnamespace=$NAMESPACE