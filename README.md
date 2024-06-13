# CVEs on github

<img src="repo.png" width="500"/>

## sbt-github-depedency-submition

https://github.com/scalacenter/sbt-dependency-submission/

how it works

- generates a snapshot json with a dependency tree
- publishes the snapshot to github
- github update CVE alerts based on the snapshot

## Setting up the workflow

see .github/workflows/dependency-graph.yml
see https://github.com/yazgoo/scala-meetup-july-2024/actions

## Monitoring CVEs

see https://github.com/yazgoo/scala-meetup-july-2024/security

## Usual tools to monitor dependencies

#### dependency tree

Add to `project/plugins.sbt`:

```scala
addDependencyTreePlugin
```

run:

```sbt
dependencyTree
whatDependsOn com.amazonaws aws-java-sdk-core 1.12.148
dependencyBrowseGraph
dependencyBrowseTree
evicted
```

find deps:

```bash
❯ coursier resolve com.google.cloud:google-cloud-bigquery:2.10.10
```

## My fork of sbt-github-depedency-submition (WIP)

https://github.com/yazgoo/sbt-dependency-submission

```sbt
githubGenerateSnapshot
githubAnalyzeDependencies alerts
githubAnalyzeDependencies cves
githubAnalyzeDependencies list jackson-databind
githubAnalyzeDependencies get jackson-databind
```

## Fixing CVEs

### fixing a CVE

several things you can do:

1. if it is a "parent lib", bump the lib
1. bump a parent of the lib
1. if you can't bump parent: 
    1. if the lib is provided by another lib, exclude it
    1. try and override the lib (**☢**  test it well because there might be incompatibilities)


----

### excluding a lib

```scala
libraryDependencies ++= Seq(
"com.datastax.cassandra" % "cassandra-driver-core" % Versions.Datastax
  exclude ("io.dropwizard.metrics", "metrics-core")
)
```

----

### overriding the lib

```scala
libraryDependencies ++= Seq(libTestKit),
dependencyOverrides ++= Seq(zookeeper),
```
- don't need to exclude lib version in sbt
- can update `libraryDependencies`
- or use `dependencyOverrides`
