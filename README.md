# app

## セットアップ
```
$ docker-compose build
$ docker-compose up
```

## 開発やビルド
末尾の `dev/stg/prd` に応じて `vue.config` 配下のビルドのコンフィグが切り替わる  
詳細は `package.json` 参照  

### 開発時にホットリロードでホスティング

```
$ docker-compose exec app yarn serve:dev
```

```
$ docker-compose exec app yarn serve:stg
```

```
$ docker-compose exec app yarn serve:prd
```

access to  
http://localhost:9051

### デプロイのためのビルド

```
$ docker-compose exec app yarn build:dev
```

```
$ docker-compose exec app yarn build:stg
```

```
$ docker-compose exec app yarn build:prd
```

### Lints and fixes files
```
yarn lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
