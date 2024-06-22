-- Genre列とPublishDate列にインデックスを作成する。
-- GenreとPublishDate列に複合インデックスを作成
CREATE INDEX idx_genre_publishdate ON Books (Genre, PublishDate);
