CREATE TABLE files
(
    file_id   INT PRIMARY KEY AUTO_INCREMENT,
    file_data LONGBLOB,
    file_type ENUM('mp3')
);

CREATE TABLE converted_files
(
    conversion_id    INT PRIMARY KEY AUTO_INCREMENT,
    original_file_id INT,
    file_data        LONGBLOB,
    file_type        ENUM('wav', 'rar'),
    FOREIGN KEY (original_file_id) REFERENCES files (file_id)
);

CREATE TABLE artists
(
    artist_id   INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100) UNIQUE
);

CREATE TABLE genres
(
    genre_id   INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(100) UNIQUE
);

CREATE TABLE albums
(
    album_id   INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(100)
);

CREATE TABLE songs
(
    song_id      INT PRIMARY KEY AUTO_INCREMENT,
    album_id     INT,
    genre_id     INT,
    file_id      INT,
    duration     INT,
    title        VARCHAR(100),
    release_date DATE,
    FOREIGN KEY (file_id) REFERENCES files (file_id),
    FOREIGN KEY (album_id) REFERENCES albums (album_id),
    FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
);

CREATE TABLE songs_artists
(
    song_id   INT,
    artist_id INT,
    PRIMARY KEY (song_id, artist_id),
    FOREIGN KEY (song_id) REFERENCES songs (song_id),
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

