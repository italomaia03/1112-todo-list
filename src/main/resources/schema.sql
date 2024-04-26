CREATE TABLE usuario
(
    id                  INT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    email               VARCHAR(255),
    username            VARCHAR(255),
    password            VARCHAR(255),
    role                VARCHAR(255),
    active              BOOLEAN DEFAULT TRUE NOT NULL,
    account_expired     BOOLEAN DEFAULT FALSE NOT NULL,
    account_locked      BOOLEAN DEFAULT FALSE NOT NULL,
    credentials_expired BOOLEAN DEFAULT FALSE NOT NULL,
    CONSTRAINT pk_usuario PRIMARY KEY (id)
);

ALTER TABLE usuario
    ADD CONSTRAINT uc_usuario_username UNIQUE (username);

CREATE TABLE todo_item
(
    id         INT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    uuid       UUID DEFAULT RANDOM_UUID(), --gen_random_uuid() para postgresql
    titulo     VARCHAR(255),
    detalhes   VARCHAR(255),
    data       TIMESTAMP,
    concluido  BOOLEAN DEFAULT FALSE,
    prioridade VARCHAR(255),
    usuario_id INT,
    CONSTRAINT pk_todoitem PRIMARY KEY (id)
);

ALTER TABLE todo_item
    ADD CONSTRAINT FK_TODOITEM_ON_USUARIO FOREIGN KEY (usuario_id) REFERENCES usuario (id);