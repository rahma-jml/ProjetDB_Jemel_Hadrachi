USE plateforme_location;


ALTER TABLE utilisateur ADD CONSTRAINT utilisateur_email
    CHECK (email_utilisateur LIKE '%_@_%.__%');


ALTER TABLE utilisateur ADD CONSTRAINT utilisateur_statut
    CHECK (statut_compte IN ('actif', 'suspendu'));


ALTER TABLE utilisateur ADD CONSTRAINT utilisateur_majeur
    CHECK (
        EXTRACT(YEAR FROM date_inscription) - EXTRACT(YEAR FROM date_naissance) > 18
        OR (EXTRACT(YEAR FROM date_inscription) - EXTRACT(YEAR FROM date_naissance) = 18
            AND EXTRACT(MONTH FROM date_inscription) * 100 + EXTRACT(DAY FROM date_inscription)
                >= EXTRACT(MONTH FROM date_naissance) * 100 + EXTRACT(DAY FROM date_naissance))
    );


ALTER TABLE utilisateur ADD CONSTRAINT utilisateur_iban
    CHECK (iban IS NULL OR (CHAR_LENGTH(iban) BETWEEN 15 AND 34 AND iban NOT LIKE '% %'));


ALTER TABLE utilisateur ADD CONSTRAINT utilisateur_iban_uniq UNIQUE (iban);




ALTER TABLE logement ADD CONSTRAINT logement_type
    CHECK (type_logement IN ('chambre', 'studio', 'appartement', 'loft', 'maison', 'villa'));


ALTER TABLE logement ADD CONSTRAINT logement_capacite
    CHECK (capacite_max BETWEEN 1 AND 20);


ALTER TABLE logement ADD CONSTRAINT logement_latitude
    CHECK (latitude BETWEEN -90 AND 90);
ALTER TABLE logement ADD CONSTRAINT logement_longitude
    CHECK (longitude BETWEEN -180 AND 180);


ALTER TABLE logement ADD CONSTRAINT logement_hote_titre UNIQUE (email_hote, titre_logement);






ALTER TABLE photo ADD CONSTRAINT photo_numero CHECK (numero_photo >= 1);


ALTER TABLE moyen_paiement ADD CONSTRAINT moyen_type
    CHECK (type_moyen_paiement IN ('carte_bancaire', 'paypal', 'virement', 'apple_pay'));





ALTER TABLE reservation ADD CONSTRAINT reservation_dates
    CHECK (date_depart > date_arrivee);


ALTER TABLE reservation ADD CONSTRAINT reservation_voyageurs
    CHECK (nb_voyageurs >= 1);


ALTER TABLE reservation ADD CONSTRAINT reservation_statut
    CHECK (statut_reservation IN ('en_attente', 'confirmee', 'annulee', 'terminee'));




ALTER TABLE paiement ADD CONSTRAINT paiement_statut
    CHECK (statut_paiement IN ('reussi', 'echoue', 'rembourse'));


ALTER TABLE paiement ADD CONSTRAINT chk_paiement_devise
    CHECK (devise IN ('EUR', 'USD', 'GBP', 'CHF'));





ALTER TABLE avis ADD CONSTRAINT avis_note
    CHECK (note_globale BETWEEN 1 AND 5);

