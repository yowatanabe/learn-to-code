# mysql

## 環境準備メモ

### イメージ取得

```bash
docker image pull mysql:latest
```

### 課題の準備

```bash
cd 番号/
docker run --rm --name mysql -v `pwd`:`pwd` -w `pwd` -it -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -d mysql:latest
docker exec -it mysql mysql -u root
```

### 課題の回答のSQLを実行する

```bash
source answer.sql
```

### 利用終了後

```bash
docker stop mysql
```