CREATE DATABASE IF NOT EXISTS plateforme_location;
USE plateforme_location;

CREATE TABLE zone_geo (
    id_zone INT NOT NULL,
    nom_zone VARCHAR(80) NOT NULL,
    id_zone_parent INT,
    PRIMARY KEY (id_zone),
    FOREIGN KEY (id_zone_parent) REFERENCES zone_geo(id_zone)
        ON UPDATE CASCADE 
        ON DELETE SET NULL
);


CREATE TABLE utilisateur (
    email_utilisateur   VARCHAR(100) NOT NULL,
    mot_de_passe        VARCHAR(255) NOT NULL,
    nom_utilisateur     VARCHAR(50)  NOT NULL,
    prenom_utilisateur  VARCHAR(50)  NOT NULL,
    date_naissance      DATE         NOT NULL,
    date_inscription    DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    statut_compte       VARCHAR(10)  NOT NULL DEFAULT 'actif',
    iban                VARCHAR(34),
    CONSTRAINT utilisateur PRIMARY KEY (email_utilisateur)
);


CREATE TABLE logement (
    id_logement      INT  NOT NULL PRIMARY KEY,
    titre_logement   VARCHAR(100)  NOT NULL,
    type_logement    VARCHAR(30)   NOT NULL,
    capacite_max     INT      NOT NULL,
    prix_nuit        DECIMAL(7,2)  NOT NULL,
    adresse_rue      VARCHAR(150)  NOT NULL,
    code_postal      VARCHAR(10)   NOT NULL,
    latitude         DECIMAL(9,6)  NOT NULL,
    longitude        DECIMAL(10,6) NOT NULL,
    email_hote       VARCHAR(100)  NOT NULL,
    id_zone          INT           NOT NULL,
    FOREIGN KEY (email_hote) REFERENCES utilisateur(email_utilisateur) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_zone) REFERENCES zone_geo(id_zone) 
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE equipement (
    id_equipement INT NOT NULL PRIMARY KEY,
    nom_equipement VARCHAR(50) NOT NULL
);

CREATE TABLE photo (
 id_logement INT NOT NULL,
 numero_photo INT NOT NULL,
 url_photo VARCHAR(255) NOT NULL,
 PRIMARY KEY (id_logement, numero_photo),
 FOREIGN KEY (id_logement) REFERENCES logement(id_logement)
 ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE proposer (
    id_logement  INT NOT NULL,
    id_equipement INT NOT NULL,
    PRIMARY KEY (id_logement, id_equipement),
    FOREIGN KEY (id_logement) REFERENCES logement(id_logement) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_equipement) REFERENCES equipement(id_equipement) 
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE moyen_paiement (
    id_moyen  INT  NOT NULL PRIMARY KEY,
    type_moyen_paiement VARCHAR(20)  NOT NULL,
    email_utilisateur   VARCHAR(100) NOT NULL,
    FOREIGN KEY (email_utilisateur) REFERENCES utilisateur(email_utilisateur) 
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE reservation (
    numero_reservation   INT   NOT NULL PRIMARY KEY,
    date_arrivee  DATE  NOT NULL,
    date_depart   DATE  NOT NULL,
    nb_voyageurs  INT  NOT NULL,
    statut_reservation   VARCHAR(15)  NOT NULL DEFAULT 'en_attente',
    montant_total  DECIMAL(9,2) NOT NULL,
    email_locataire  VARCHAR(100) NOT NULL,
    id_logement   INT    NOT NULL,
    FOREIGN KEY (email_locataire) REFERENCES utilisateur(email_utilisateur) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_logement) REFERENCES logement(id_logement) 
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE paiement (
    ref_transaction   VARCHAR(30)  NOT NULL PRIMARY KEY,
    montant_paiement   DECIMAL(9,2) NOT NULL,
    devise   CHAR(3)   NOT NULL DEFAULT 'EUR',
    date_paiement  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    statut_paiement  VARCHAR(10)  NOT NULL,
    numero_reservation   INT  NOT NULL,
    id_moyen   INT  NOT NULL,
    ref_transaction_origine   VARCHAR(30),
    FOREIGN KEY (numero_reservation) REFERENCES reservation(numero_reservation) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_moyen) REFERENCES moyen_paiement(id_moyen) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ref_transaction_origine) REFERENCES paiement(ref_transaction) 
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE avis (
    id_avis    INT  NOT NULL PRIMARY KEY,
    note_globale   INT  NOT NULL,
    commentaire_avis   VARCHAR(1000),
    numero_reservation INT   NOT NULL UNIQUE,
    FOREIGN KEY (numero_reservation) REFERENCES reservation(numero_reservation) 
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE recherche (
    id_recherche      INT   NOT NULL PRIMARY KEY,
    date_recherche    DATETIME  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    email_utilisateur VARCHAR(100) NOT NULL,
    id_zone  INT,
    FOREIGN KEY (email_utilisateur) REFERENCES utilisateur(email_utilisateur) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_zone) REFERENCES zone_geo(id_zone) 
        ON UPDATE CASCADE ON DELETE SET NULL
);
