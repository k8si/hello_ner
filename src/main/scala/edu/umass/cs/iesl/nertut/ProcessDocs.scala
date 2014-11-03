package edu.umass.cs.iesl.nertut

import cc.factorie.app.nlp.{Document, DocumentAnnotator, Token}
import cc.factorie.util.CmdOptions

/**
 * Note: You could probably just use cc.factorie.app.nlp.DocumentAnnotationPipeline instead...
 */

trait Component extends DocumentAnnotator {
  def prereqAttrs: Iterable[Class[_]] = null
  def postAttrs: Iterable[Class[_]] = null
  def process1(doc: Document): Document
  override def process(doc: Document): Document = { throw new IllegalStateException("In order to make everything minimally compatible with DocumentAnnotators, you should be calling process1()") }
  def init(): Unit = ()
  def tokenAnnotationString(t: Token): String = ""
}

trait ChainedComponent extends Component {
  val components: Seq[Component]
  private lazy val processPipeline: (Document) => Document =
    components.map(c => (d: Document) => c.process1(d)).reduceLeft(_ andThen _)
  def process1(doc: Document): Document = processPipeline(doc)
  private def initPipeline() = components.foreach(c => c.init())
  override def init(): Unit = initPipeline()
}

object NERComponent extends Component {
  import cc.factorie.app.nlp.ner._
  lazy val tagger = ConllChainNer
  def process1(doc: Document): Document = { tagger.process(doc) }
}

object Pipeline extends ChainedComponent {
  lazy val components = Seq(NERComponent)
}

class ProcessOpts extends CmdOptions{
  val dataFiles = new CmdOption("data-files", Nil.asInstanceOf[List[String]], "FILENAME...", "List of files to process (comma-separated).")
  val outFile = new CmdOption("out-file", "", "FILENAME...", "Output file.")
}

object DocProcessor {
  def apply(docs: Seq[Document]): Unit = {
    println(s"NER tagger processing ${docs.length} documents...")
    docs.foreach(doc => Pipeline.process1(doc))
    println("done.")
  }
}