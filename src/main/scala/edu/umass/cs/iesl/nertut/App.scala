package edu.umass.cs.iesl.nertut

import cc.factorie.app.nlp._
import cc.factorie.app.nlp.ner._

object App {
  def main(args : Array[String]): Unit = {
    val string = "Hello President Bush"
    val doc = new Document("")
    string.split(" ").foreach(new Token(doc, _))
    DocProcessor(Seq(doc)) //process i.e. NER tag the documents
    doc.sections.flatMap(_.tokens).foreach(token => println(s"${token.string} ${token.attr[BilouConllNerTag].categoryValue}"))
  }
}
