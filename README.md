    FACTORIE NER Quickstart Guide
=========

## Training Models

The scripts I use to train models are in the `bin/` folder. In the past, I've also used [Maven launchers](http://scala-tools.org/mvnsites/maven-scala-plugin/usage_run.html).

1. Generate your classpath using `mvn dependency:build-classpath` and copy/paste the output into `bin/train-conllchain-ner.sh` in the appropriate place to set the `CP` variable.

2. Clone FACTORIE, `cd` into the directory, and generate a jar using 

		mvn -Dmaven.test.skip=true package -Pnlp-jar-with-dependencies 

	Then copy/paste the path to the jar into `bin/train-conllchain-ner.sh` to set the `factoriejar` variable.

3. Change other options as desired (see e.g. `cc.factorie.app.nlp.ner.ChainNerOpts` for available options)

4. Run

		$ ./bin/train-conllchain-ner.sh

Note #1: the lexicons use a significant amount of memory and you may have to modify your JVM heap size or something

### Hyperparamter Optimization

Repeat the above, except using `bin/optimize-conllchain-ner.sh`.

## Data

CoNLL 2003 (on blake):
* training set: `/iesl/data/conll/2003/eng.train`
* dev set: `/iesl/data/conll/2003/eng.testa`
* test set: `/iesl/data/conll/2003/eng.testb`

Brown Clusters (on blake):
* `/iesl/canvas/ksilvers/data/brownBllipClusters` (I copied this from A. Passos' folder)



## Processing Documents
### Option 1: Use FACTORIE directly

1. Clone FACTORIE
2. Package i.e. `mvn -Dmaven.test.skip=true package -Pnlp-jar-with-dependencies`
3. Start FACTORIE using ConllChainNer:

		$ bin/fac nlp --conll-chain-ner
		
4. Process data:

		$ echo "Hello President Bush" | nc localhost 3228

### Option 2: Use FACTORIE in your own project
See `src/main/scala/edu/umass/cs/iesl/nertut/App.scala`
