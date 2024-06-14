name := "scala-meetup-june-2024"

version := "0.1"

scalaVersion := "3.4.2"

val sparkVersion = "3.0.1"

libraryDependencies ++= Seq(
  "org.scala-lang" % "scala3-library_3" % scalaVersion.value,
  "com.amazonaws" % "aws-java-sdk-secretsmanager" % "1.12.741"
)
