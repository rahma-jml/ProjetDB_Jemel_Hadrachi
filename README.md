# Mini-projet BD (TI503N) : plateforme de location de logements

**Partie 1 : analyse des besoins et MCD**

Groupe : JEMEL Rahma et HADRACHI Lila 

---

## Étape 1 : analyse des besoins

## Domaine choisi

Une entreprise de location de logements de courte durée entre particuliers, du même type qu'Airbnb, Booking ou Abritel. Elle met en relation des hôtes et des voyageurs et gère les paiements. Les données concernent comptes et profils, logements et réservations, paiements et transactions, recherches, localisation, avis et commentaires.

## Prompt final

Tu travailles dans le domaine de la location d'immobilier . Ton entreprise a comme activité de louer des biens immobiliers. C'est une entreprise comme Airbnb, Booking et Kayak. On va s'interesser aux informations concernant le compte et le profil, informations sur  les logements et reservations,informations de paiements et transaction, recherches effectuées sur la plateforme, la localisation , les avis et commentaires du site. Inspire-toi des sites suivant : Airbnb et Booking 
Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c'est-à-dire de collecter les besoins auprès de l'entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu'il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.  
D'abord, établis les règles de gestions des données de ton entreprise , sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l'entreprise, mais pas comment se construit un système d'information. 
Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite. 
Fournis donc les règles de gestion et le dictionnaire de données. 
 


## Règles de gestion

### Comptes et profils
- Toute personne qui veut réserver ou proposer un logement doit d'abord créer un compte avec une adresse e-mail et un mot de passe.
- Une adresse e-mail ne peut être utilisée que pour un seul compte.
- Chaque utilisateur renseigne un profil : nom, prénom, date de naissance, numéro de téléphone, pays de résidence, langue préférée et une courte présentation.
- Il faut avoir 18 ans révolus pour créer un compte.
- Un même compte peut servir à voyager (locataire) et à proposer des logements (hôte) : il n'y a pas besoin de deux comptes.
- La date d'inscription est enregistrée automatiquement à la création du compte.
- Un compte peut être suspendu par la plateforme (fraude, comportement abusif) ; il porte alors un statut "suspendu" et ne peut plus réserver ni publier.

### Logements
- Un logement appartient à un seul hôte, mais un hôte peut en publier plusieurs.
- Chaque logement a un titre, une description, un type (appartement, maison, chambre, villa, etc.), une surface, un nombre de chambres, un nombre de lits et une capacité maximale de voyageurs.
- Chaque logement est situé à une adresse précise (rue, code postal, ville, pays) et possède des coordonnées GPS pour l'afficher sur la carte.
- L'hôte fixe un prix par nuit, des frais de ménage éventuels, une heure d'arrivée et une heure de départ.
- Un logement dispose d'équipements (wifi, cuisine, parking, piscine, climatisation, etc.) et peut en avoir plusieurs ; un même équipement peut se retrouver dans plusieurs logements.
- Un logement possède plusieurs photos, dont une photo de couverture.
- L'hôte gère un calendrier de disponibilités : il peut bloquer des dates ou modifier le prix pour certaines périodes.
- Un logement peut être désactivé temporairement par son hôte sans être supprimé.

### Recherches
- Un visiteur, connecté ou non, peut rechercher un logement selon une destination, une date d'arrivée, une date de départ et un nombre de voyageurs.
- Il peut affiner sa recherche par prix maximum, type de logement, équipements et note minimale.
- La plateforme conserve l'historique des recherches d'un utilisateur connecté (date, critères) afin de lui proposer des suggestions personnalisées.
- Les résultats peuvent s'afficher en liste ou sur une carte, autour d'une zone géographique choisie.

### Réservations
- Un locataire réserve un logement pour une période donnée : date d'arrivée, date de départ et nombre de voyageurs.
- Une réservation n'est possible que si le logement est libre sur toute la période et si le nombre de voyageurs ne dépasse pas la capacité.
- Un logement ne peut pas avoir deux réservations qui se chevauchent.
- Chaque réservation a un numéro unique, une date de création et un statut : en attente, confirmée, annulée, terminée.
- Le montant total est calculé à partir du prix par nuit, du nombre de nuits, des frais de ménage et des frais de service de la plateforme.
- Un locataire peut annuler sa réservation ; le remboursement dépend de la politique d'annulation choisie par l'hôte (flexible, modérée ou stricte) et de la date d'annulation.
- Un hôte peut aussi annuler une réservation confirmée, ce qui déclenche un remboursement intégral au locataire.

### Paiements et transactions
- Toute réservation confirmée donne lieu à au moins un paiement du locataire.
- Un paiement est effectué avec un moyen de paiement (carte bancaire, PayPal, virement, etc.) préalablement enregistré dans le compte du locataire.
- Un locataire peut enregistrer plusieurs moyens de paiement, dont un par défaut.
- Chaque paiement possède un montant, une devise, une date, un statut (réussi, échoué, remboursé) et une référence de transaction unique.
- Le paiement peut être fractionné : un acompte à la réservation, puis le solde avant l'arrivée.
- La plateforme prélève une commission sur chaque réservation et reverse le reste à l'hôte 24 heures après l'arrivée du locataire.
- Pour recevoir ses versements, l'hôte enregistre un compte bancaire (IBAN).
- Une facture est éditée pour chaque réservation payée.
- Un remboursement est enregistré comme une transaction distincte, liée au paiement d'origine.

### Avis et commentaires
- Seul un locataire ayant effectué un séjour terminé peut laisser un avis sur le logement, et un seul avis par séjour.
- L'avis comprend une note globale de 1 à 5, des notes détaillées (propreté, communication, emplacement, rapport qualité-prix), un commentaire libre et une date de publication.
- L'hôte peut aussi noter le locataire après le séjour.
- L'hôte peut répondre publiquement à un avis reçu.
- La note moyenne d'un logement est calculée à partir de tous les avis reçus et s'affiche sur sa page.
- La plateforme peut masquer un commentaire qui enfreint ses règles (propos injurieux, hors sujet).

### Communication
- Un locataire peut envoyer un message à l'hôte avant ou après la réservation, dans une conversation rattachée à cette réservation ou à ce logement.

### Localisation
- Les logements sont classés par pays, ville et quartier, ce qui permet de rechercher par zone.
- Les prix sont affichés dans la devise choisie par l'utilisateur, et l'interface est proposée dans sa langue préférée.

## Dictionnaire de données

Types : **AN** alphanumérique, **N** numérique entier, **D** décimal (taille = nombre total de chiffres), **Date** (AAAA-MM-JJ), **DateHeure** (AAAA-MM-JJ hh:mm:ss).

| N° | Code | Signification de la donnée | Type | Taille |
|---|---|---|---|---|
| 1 | email_utilisateur | Adresse e-mail de l'utilisateur, unique | AN | 100 |
| 2 | mot_de_passe | Mot de passe de connexion (stocké chiffré) | AN | 255 |
| 3 | nom_utilisateur | Nom de famille de l'utilisateur | AN | 50 |
| 4 | prenom_utilisateur | Prénom de l'utilisateur | AN | 50 |
| 5 | date_naissance | Date de naissance de l'utilisateur | Date | 10 |
| 6 | date_inscription | Date et heure de création du compte | DateHeure | 19 |
| 7 | statut_compte | Statut du compte (actif, suspendu) | AN | 10 |
| 8 | iban | Compte bancaire de l'hôte pour recevoir ses versements | AN | 34 |
| 9 | titre_logement | Titre de l'annonce du logement | AN | 100 |
| 10 | type_logement | Type de logement (appartement, maison, chambre, villa…) | AN | 30 |
| 11 | capacite_max | Nombre maximal de voyageurs accueillis | N | 2 |
| 12 | prix_nuit | Prix du logement pour une nuit | D | 7 |
| 13 | adresse_rue | Numéro et nom de la rue du logement | AN | 150 |
| 14 | code_postal | Code postal de l'adresse du logement | AN | 10 |
| 15 | latitude | Latitude GPS du logement | D | 9 |
| 16 | longitude | Longitude GPS du logement | D | 10 |
| 17 | libelle_equipement | Nom d'un équipement (wifi, parking, piscine…) | AN | 50 |
| 18 | numero_photo | Numéro d'ordre d'une photo dans un logement | N | 2 |
| 19 | url_photo | Adresse du fichier image d'une photo | AN | 255 |
| 20 | nom_zone | Nom d'une zone géographique (pays, ville ou quartier) | AN | 80 |
| 21 | numero_reservation | Numéro unique d'une réservation | N | 10 |
| 22 | date_arrivee | Date d'arrivée du séjour | Date | 10 |
| 23 | date_depart | Date de départ du séjour | Date | 10 |
| 24 | nb_voyageurs | Nombre de voyageurs d'une réservation | N | 2 |
| 25 | statut_reservation | Statut (en attente, confirmée, annulée, terminée) | AN | 15 |
| 26 | montant_total | Montant total facturé pour la réservation | D | 9 |
| 27 | type_moyen_paiement | Type de moyen de paiement (carte, PayPal, virement…) | AN | 20 |
| 28 | ref_transaction | Référence unique d'une transaction | AN | 30 |
| 29 | montant_paiement | Montant d'un paiement ou d'un remboursement | D | 9 |
| 30 | devise | Code de la devise (EUR, USD…) | AN | 3 |
| 31 | date_paiement | Date et heure de la transaction | DateHeure | 19 |
| 32 | statut_paiement | Statut (réussi, échoué, remboursé) | AN | 10 |
| 33 | date_recherche | Date et heure d'une recherche enregistrée | DateHeure | 19 |
| 34 | note_globale | Note globale d'un avis, de 1 à 5 | N | 1 |
| 35 | commentaire_avis | Commentaire libre laissé dans un avis | AN | 1000 |


MCD : 

![alt text](image.png)
