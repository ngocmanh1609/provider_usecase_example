class GithubOverviewUiModel {
  final int id;
  final String repoPath;
  final String repositoryName;
  final String repositoryDescription;
  final String ownerName;
  final String ownerAvatar;

  GithubOverviewUiModel(
      {this.id,
      this.repoPath,
      this.repositoryName,
      this.repositoryDescription,
      this.ownerName,
      this.ownerAvatar});
}
