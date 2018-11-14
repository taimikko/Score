CREATE TABLE seura(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lyhenne` varchar(50),
  `nimi` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;

CREATE TABLE kentta (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seura_id` int(11) NOT NULL DEFAULT '0',
  `kentan_lyhenne` varchar(50) NOT NULL,
  `kentan_nimi` varchar(50) NOT NULL,
  #`yhteystiedot` varchar(200) NOT NULL,
  # koordinaatit ?
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;
# seura_id -> seura.id
ALTER TABLE kentta ADD CONSTRAINT `key_seura_id` FOREIGN KEY (`seura_id`) REFERENCES `seura` (`id`);

# kentällä/reiällä on 1 - n tiitä
CREATE TABLE tii(
  id int(11) NOT NULL AUTO_INCREMENT,
  kentta_id int(11) NOT NULL DEFAULT '0',
  tii_id int(11) NOT NULL DEFAULT '0',  # 1,2,3 tai 48, 52, 56, 61
  tii_nimi varchar(50) NOT NULL,      # keltainen tai 52
  tii_lyhenne varchar(50) NOT NULL, # kel, 52
  slope int(3) NOT NULL,
  cr dec(5,1) NOT NULL,
  sukup int(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;
# kentta_id = kentta.id
ALTER TABLE tii ADD CONSTRAINT `key_kentta_id` FOREIGN KEY (`kentta_id`) REFERENCES `kentta` (`id`);


# kentällä on 6 - 18 väylää/reikää
CREATE TABLE vayla(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kentta_id` int(11) NOT NULL DEFAULT '0',
  # `seura_id` int(11) NOT NULL DEFAULT '0',
  `numero` int(2) NOT NULL DEFAULT '0',
  `nimi` varchar(50) ,
  `par` int(1) NOT NULL DEFAULT '0',
  # kulta tms ?
  `pit1` int(3) NOT NULL DEFAULT '0',  # valk / 63
  `pit2` int(3) NOT NULL DEFAULT '0', # kel / 58
  `pit3` int(3) NOT NULL DEFAULT '0', # sin / 52
  `pit4` int(3) NOT NULL DEFAULT '0', # pun / 48
  # musta/oranssi ?
  `hcp` int(2) NOT NULL DEFAULT '0',
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;
# kentta_id = kentta.id
# kentta_id + numero yksilöi
CREATE UNIQUE INDEX idx_kentta_vayla ON vayla (kentta_id, numero);
ALTER TABLE vayla ADD CONSTRAINT `key_kentta_id2` FOREIGN KEY (`kentta_id`) REFERENCES `kentta` (`id`);


CREATE TABLE `pelaaja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pvm` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seura_id` int(11) NOT NULL DEFAULT '0',
  `jasennumero` int(11) NOT NULL DEFAULT '0',
  `sukunimi` varchar(50) NOT NULL,
  `etunimi` varchar(50) NOT NULL,
  `sukup` int(1),
  `jasen_tyyppi` int(11) NOT NULL,
  `tasoitus` decimal(4,1) NOT NULL,
  `tasoitus_voimassa` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;
CREATE UNIQUE INDEX pelaaja_idx ON pelaaja (pvm, seura_id, jasennumero);

# pelaajan tasoitus voi muuttua päivittäin -> jaetaanko pelaajan henkilötiedot ja tasoitustiedot erikseen?
# seura_id +jäsennumero + päivä yksilöi = yhtenä päivänä seurassa voi olla vain yksi hlö ko. Numerolla
# tarvitaanko tasoitusmuutoksille oma taulu ?


# yhteystieto voi olla kentällä tai seuralla (jompi kumpi tarvitaan)
CREATE TABLE yhteystiedot (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kentta_id` int(11) DEFAULT '0',
  `seura_id` int(11) DEFAULT '0',
  `yhteys_id` int(11) NOT NULL DEFAULT '0',
  `otsikko` varchar(50) NOT NULL,
  `nimi` varchar(50) NOT NULL,
  `kentan_nimi` varchar(50) NOT NULL,
  `osoite` varchar(200) NOT NULL,
  `puhelin` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `www` varchar(200) NOT NULL,
  `lisatieto` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;


################
 PRIMARY KEY (`id`),
  UNIQUE KEY `user_role_uk` (`user_id`,`role_id`),
  KEY `user_role_fk2` (`role_id`),
  CONSTRAINT `user_role_fk1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`),
  CONSTRAINT `user_role_fk2` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`role_id`)



  


