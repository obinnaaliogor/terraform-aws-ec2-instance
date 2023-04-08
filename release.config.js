module.exports = {
    branches: "main",
    repositoryUrl: "https://github.com/obinnaaliogor/terraform-aws-ec2-instance.git",
    plugins: [
      '@semantic-release/commit-analyzer',
      '@semantic-release/release-notes-generator',
      '@semantic-release/git',
      '@semantic-release/github']
 }