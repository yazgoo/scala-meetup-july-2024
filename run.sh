set -x
sbt "githubGenerateSnapshot;githubAnalyzeDependencies alerts;githubAnalyzeDependencies cves;githubAnalyzeDependencies list jackson-databind;githubAnalyzeDependencies get jackson-databind:2.12.3"
