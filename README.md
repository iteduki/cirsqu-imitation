# README

1. イメージをビルドする
   - `cp docker-compose.yml.example docker-compose.yml`
   - `docker-compose build`
2. コンテナを起動する
   - `docker-compose up -d`
3. データベース作成
   - `docker-compose exec web rails db:setup`
4. アクセス
   - [`localhost:3000`](http://localhost:3000)
