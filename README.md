# ShibuyaRubyKaigi01

http://regional.rubykaigi.org/shibuya01/

## スタッフ向け

### 準備

  1. リポジトリをローカルにクローン

        git clone git@github.com:shibuyarb/shibuya01.git

  2. 必要なgemをインストール

        cd shibuya01
        bundle install

  3. Mac以外の場合、Node.jsをインストール

        # aptの例
        sudo apt-get install nodejs

### 修正

必要に応じて、修正前に`git fetch origin`からの`git merge origin/master`
などでサーバーの最新版を持って来る。

  1. 以下のコマンドでローカルにサーバーを立ち上げ

        bundle exec middleman server

  2. ブラウザで以下のURLを開く

    [http://localhost:4567](http://localhost:4567)

  3. sourceディレクトリかdataディレクトリ内のファイルを修正

  4. ブラウザを更新して確認

  5. まあまあだったら、コミットしてプッシュする

        git add .
        git commit -m "どれそれ修正"
        git push origin master

### ビルド

デプロイせずにHTMLなどを生成したいとき用。普段は自動でビルドされるため不要

  1. 以下のコマンドでHTMLなどをbuildディレクトリ内に生成

        bundle exec middleman build

### デプロイ

自動でビルドしてからデプロイされるよう`config.rb`で設定済み。

  1. 以下のコマンドでGitHub Pagesにデプロイ

        bundle exec middleman deploy

## Thanks

https://github.com/chuork/chuork01
