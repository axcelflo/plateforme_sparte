#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Utilisateur
#------------------------------------------------------------

CREATE TABLE Utilisateur(
        Nom          Char (10) NOT NULL ,
        Prenom       Char (10) NOT NULL ,
        Mot_de_passe Varchar (10) NOT NULL ,
        iD           Int  Auto_increment  NOT NULL
	,CONSTRAINT Utilisateur_AK UNIQUE (iD)
	,CONSTRAINT Utilisateur_PK PRIMARY KEY (Nom,Prenom,Mot_de_passe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Stock
#------------------------------------------------------------

CREATE TABLE Stock(
        Nom        Char (10) NOT NULL ,
        Model      Char (10) NOT NULL ,
        Quantite   Int NOT NULL ,
        Etat       Varchar (10) NOT NULL ,
        Date_depot Date NOT NULL ,
        id         Int  Auto_increment  NOT NULL
	,CONSTRAINT Stock_AK UNIQUE (id)
	,CONSTRAINT Stock_PK PRIMARY KEY (Nom,Model)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Effectuer
#------------------------------------------------------------

CREATE TABLE Effectuer(
        Nom                      Char (10) NOT NULL ,
        Model                    Char (10) NOT NULL ,
        Nom_Utilisateur          Char (10) NOT NULL ,
        Prenom_Utilisateur       Char (10) NOT NULL ,
        Mot_de_passe_Utilisateur Varchar (10) NOT NULL ,
        quantite                 Decimal (15,2) ,
        date_stock               Date
	,CONSTRAINT Effectuer_PK PRIMARY KEY (Nom,Model,Nom_Utilisateur,Prenom_Utilisateur,Mot_de_passe_Utilisateur)

	,CONSTRAINT Effectuer_Stock_FK FOREIGN KEY (Nom,Model) REFERENCES Stock(Nom,Model)
	,CONSTRAINT Effectuer_Utilisateur0_FK FOREIGN KEY (Nom_Utilisateur,Prenom_Utilisateur,Mot_de_passe_Utilisateur) REFERENCES Utilisateur(Nom,Prenom,Mot_de_passe)
)ENGINE=InnoDB;

