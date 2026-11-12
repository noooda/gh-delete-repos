# gh-delete-repos
GitHub CLI（`gh`）を使って、複数のGitHubリポジトリをまとめて削除するBashスクリプトです。

## 特徴
- コマンドライン引数で複数のリポジトリを指定できます
- `gh repo delete --yes` を使い、リポジトリごとの確認入力を省略します
- リポジトリごとに削除結果を表示します
- 一部のリポジトリの削除に失敗しても、残りの削除処理を続けます

> [!WARNING]
> **このスクリプトは指定されたリポジトリを確認なしで削除します。**
> GitHub上のIssues、Pull Requests、Wikiなどにも影響します。復元できない場合があるため、必ず実行前に対象を確認し、必要なデータをバックアップしてください。

## 必要な環境
- Bash
- [GitHub CLI（`gh`）](https://cli.github.com/)
- 対象リポジトリを削除できるGitHubアカウントの権限

### GitHub CLIの認証

GitHub CLIで認証していない場合は、以下を実行してください。
```bash
gh auth login
```

削除権限（`delete_repo` スコープ）が不足している場合は、以下を実行して認可を更新します。
```bash
gh auth refresh -s delete_repo
```

### スクリプトの実行権限 
スクリプトを直接実行できるように、実行権限を付与します。
```bash
chmod 755 gh-delete-repos.sh
```

## 使い方
削除対象を `owner/repository` の形式で指定します。
```bash
./gh-delete-repos.sh \
  username/repo1 \
  username/repo2 \
  username/repo3
```

実行すると対象一覧が表示され、各リポジトリが順番に削除されます。  
**個別の確認プロンプトは表示されません。**

対象を指定せずに実行すると、使い方が表示されます。
```bash
./gh-delete-repos.sh
# Usage: ./gh-delete-repos.sh owner/repo1 owner/repo2 ...
```
