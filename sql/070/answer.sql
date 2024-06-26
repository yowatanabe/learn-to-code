-- LibraryテーブルのGenre列とPublishDate列に複合インデックスを作成
CREATE INDEX idx_genre_publishdate ON Library (Genre, PublishDate);
