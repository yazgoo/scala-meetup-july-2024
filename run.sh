set -x
sbt "githubGenerateSnapshot;githubAnalyzeDependencies alerts yazgoo/scala-meetup-july-2024;githubAnalyzeDependencies cves;githubAnalyzeDependencies list jackson-databind;githubAnalyzeDependencies get jackson-databind"
