#!/bin/bash

# Train a model using ConllChainNer

MEMORY=48g

echo "generate classpath using:"
echo "mvn dependency:build-classpath"
echo "then copy and paste it here"
#CP=/home/ksilvers/.m2/repository/com/fasterxml/jackson/core/jackson-annotations/2.2.3/jackson-annotations-2.2.3.jar:/home/ksilvers/.m2/repository/com/fasterxml/jackson/core/jackson-core/2.2.3/jackson-core-2.2.3.jar:/home/ksilvers/.m2/repository/com/fasterxml/jackson/core/jackson-databind/2.2.2/jackson-databind-2.2.2.jar:/home/ksilvers/.m2/repository/com/fasterxml/jackson/module/jackson-module-scala_2.10/2.2.3/jackson-module-scala_2.10-2.2.3.jar:/home/ksilvers/.m2/repository/com/google/code/findbugs/jsr305/2.0.1/jsr305-2.0.1.jar:/home/ksilvers/.m2/repository/com/google/guava/guava/13.0.1/guava-13.0.1.jar:/home/ksilvers/.m2/repository/com/thoughtworks/paranamer/paranamer/2.3/paranamer-2.3.jar:/home/ksilvers/.m2/repository/com/typesafe/config/1.0.0/config-1.0.0.jar:/home/ksilvers/.m2/repository/com/typesafe/akka/akka-actor_2.10/2.1.4/akka-actor_2.10-2.1.4.jar:/home/ksilvers/.m2/repository/commons-codec/commons-codec/1.2/commons-codec-1.2.jar:/home/ksilvers/.m2/repository/commons-httpclient/commons-httpclient/3.1/commons-httpclient-3.1.jar:/home/ksilvers/.m2/repository/commons-logging/commons-logging/1.0.4/commons-logging-1.0.4.jar:/home/ksilvers/.m2/repository/info/bliki/wiki/bliki-core/3.0.19/bliki-core-3.0.19.jar:/home/ksilvers/.m2/repository/junit/junit/4.10/junit-4.10.jar:/home/ksilvers/.m2/repository/org/apache/commons/commons-compress/1.8/commons-compress-1.8.jar:/home/ksilvers/.m2/repository/org/hamcrest/hamcrest-core/1.1/hamcrest-core-1.1.jar:/home/ksilvers/.m2/repository/org/jblas/jblas/1.2.3/jblas-1.2.3.jar:/home/ksilvers/.m2/repository/org/mongodb/mongo-java-driver/2.11.1/mongo-java-driver-2.11.1.jar:/home/ksilvers/.m2/repository/org/scala-lang/scala-actors/2.10.0/scala-actors-2.10.0.jar:/home/ksilvers/.m2/repository/org/scala-lang/scala-compiler/2.10.4/scala-compiler-2.10.4.jar:/home/ksilvers/.m2/repository/org/scala-lang/scala-library/2.10.4/scala-library-2.10.4.jar:/home/ksilvers/.m2/repository/org/scala-lang/scala-reflect/2.10.4/scala-reflect-2.10.4.jar:/home/ksilvers/.m2/repository/org/scalatest/scalatest_2.10/1.9.1/scalatest_2.10-1.9.1.jar:/home/ksilvers/.m2/repository/org/tukaani/xz/1.5/xz-1.5.jar:/home/ksilvers/.m2/repository/org/xerial/snappy/snappy-java/1.1.1.3/snappy-java-1.1.1.3.jar

echo "generate a jar of FACTORIE using:"
echo "mvn -Dmaven.test.skip=true package -Pnlp-jar-with-dependencies"
echo "then copy and paste the path to it here"
#factoriejar=/iesl/canvas/ksilvers/master-factorie/target/factorie-1.1-SNAPSHOT-nlp-jar-with-dependencies.jar

trainf=/iesl/canvas/ksilvers/data/conll03/eng.train
testf=/iesl/canvas/ksilvers/data/conll03/eng.testa
model="ConllChainNer.factorie" #filename the serialized model will be saved to

java -classpath $factoriejar:$CP -Xmx$MEMORY cc.factorie.app.nlp.ner.ConllChainNerTrainer --train=$trainf --test=$testf --save-model=$model --serialize=true
