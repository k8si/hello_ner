FACTORIE NER Quickstart Guide
=========

## Training Models

1. Generate your classpath using `mvn dependency:build-classpath` and copy/paste the output into `bin/train-conllchain-ner.sh` in the appropriate place (i.e. `CP`)

2. Clone FACTORIE, `cd` into the directory, and generate a jar using `mvn -Dmaven.test.skip=true package -Pnlp-jar-with-dependencies`. Then copy/paste the path to the jar into `bin/train-conllchain-ner.sh` (i.e. `factoriejar`)

3. Change other options as desired

4. Run

		$ ./bin/train-conllchain-ner.sh

Note: the lexicons use a significant amount of memory and you may have to modify your JVM heap size or something.

### Hyperparamter Optimization

Repeat the above, except using `bin/optimize-conllchain-ner.sh`.

## Data

CoNLL 2003 (on blake):
* training set: `/iesl/data/conll/2003/eng.train`
* dev set: `/iesl/data/conll/2003/eng.testa`
* test set: `/iesl/data/conll/2003/eng.testb`

Brown Clusters (on blake):
* `/iesl/canvas/ksilvers/data/brownBllipClusters` (I copied this from A. Passos' folder)

$ echo "Mr. Jones took a job at Google in New York.  He and his Australian wife moved from New South Wales on 4/1/12." | nc localhost 3228


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
