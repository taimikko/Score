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
# ALTER TABLE tii DROP foreign KEY key_kentta_id;
ALTER TABLE kentta ADD CONSTRAINT `key_seura_id` FOREIGN KEY (`seura_id`) \
  REFERENCES `seura` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

MSA: yo. ei saa påivitettyä !!!!


# kentällä/reiällä on 1 - n tiitä
CREATE TABLE tii(
  id int(11) NOT NULL AUTO_INCREMENT,
  kentta_id int(11) NOT NULL DEFAULT '0',
  tii_id int(2) NOT NULL DEFAULT '0',  # 1,2,3 tai 48, 52, 56, 61
  tii_nimi varchar(50) NOT NULL,      # keltainen tai 52
  tii_lyhenne varchar(50) NOT NULL, # kel, 52
  slope int(3) NOT NULL,
  cr dec(5,1) NOT NULL,
  sukup int(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;
CREATE UNIQUE INDEX idx_kentta_tii_sukup ON tii (kentta_id, tii_id, sukup);
# kentta_id = kentta.id
ALTER TABLE tii ADD CONSTRAINT `key_kentta_id` FOREIGN KEY (`kentta_id`) \ 
  REFERENCES `kentta` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
CREATE INDEX idx_kentta_tii ON tii (kentta_id, tii_id);
#1.11.2018 rakennetta muutettu (dataa jo sisällä)
ALTER TABLE tii ADD slope_n int(3) NOT NULL;
ALTER TABLE tii ADD cr_n decimal(5,1) NOT NULL;
UPDATE tii t1, tii t2 SET t1.cr_n=t2.cr 
WHERE t2.sukup=2 AND t1.sukup=1 AND t1.kentta_id=t2.kentta_id AND t1.tii_id=t2.tii_id;

UPDATE tii t1, tii t2 SET t1.slope_n=t2.slope
WHERE t2.sukup=2 AND t1.sukup=1 AND t1.kentta_id=t2.kentta_id AND t1.tii_id=t2.tii_id;

DELETE FROM tii WHERE sukup=2;
ALTER TABLE tii DROP sukup;




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
ALTER TABLE vayla ADD CONSTRAINT `key_kentta_id2` FOREIGN KEY (`kentta_id`) \
  REFERENCES `kentta` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;


CREATE TABLE `pelaaja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pvm` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seura_id` int(11) NOT NULL DEFAULT '0',
  `jasennumero` int(11) NOT NULL DEFAULT '0',
#  `sukunimi` varchar(50) NOT NULL,
#  `etunimi` varchar(50) NOT NULL,
  `sukup` int(1),
#  `jasen_tyyppi` int(11) NOT NULL,
  `tasoitus` decimal(4,1) NOT NULL,
  `tasoitus_voimassa` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;
CREATE UNIQUE INDEX pelaaja_idx ON pelaaja (pvm, seura_id, jasennumero);
CREATE INDEX seura_jasen_idx ON pelaaja (seura_id, jasennumero);
# seura_id + jasennumero = user_id

# 8.10.2018 nimi siirretty kayttaja:aan
# alter table pelaaja drop column etunimi;
# alter table pelaaja drop column sukunimi;
# 12.10.2018 sukup siirretty pelaajalta käyttäjälle
# alter table pelaaja drop sukup;
# 30.10.2018 jäsenyden tyyppi siirretty käyttäjän tietoihin

alter table pelaaja drop jasen_tyyppi;

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

CREATE TABLE jasen_tyyppi (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tyyppi` varchar(20) NOT NULL,
  `kuvaus` varchar(200),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;
# 1 juniori
# 2 jäsen
# 3 seniori
# 4 ulkojäsen
# 5 kunniajäsen
# 6 entinen jäsen
# 9 pro 

CREATE TABLE kierros (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pvm` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jasennumero` int(11) NOT NULL DEFAULT '0',
  `jasenseura` int(11) NOT NULL DEFAULT '0',
  `kentta_id` int(11) DEFAULT '0',
  `tasoitus` decimal(4,1) NOT NULL,
  `tii_id` int(2) NOT NULL DEFAULT '0',  # 1,2,3 tai 48, 52, 56, 61
  `pelitasoitus` int(3) NOT NULL,
   `cba` decimal(3,1) DEFAULT 0,
   `h1` int(2),
   `h2` int(2),
   `h3` int(2),
   `h4` int(2),
   `h5` int(2),
   `h6` int(2),
   `h7` int(2),
   `h8` int(2),
   `h9` int(2),
   `out` int(3),
   `h10` int(2),
   `h11` int(2),
   `h12` int(2),
   `h13` int(2),
   `h14` int(2),
   `h15` int(2),
   `h16` int(2),
   `h17` int(2),
   `h18` int(2),
   `in` int(3),
   `yhteensa` int(3),
   `merkitsija` varchar(50),
   `lisatieto` varchar(200) NOT NULL,
   `p1` int(1),
   `p2` int(1),
   `p3` int(1),
   `p4` int(1),
   `p5` int(1),
   `p6` int(1),
   `p7` int(1),
   `p8` int(1),
   `p9` int(1),
   `p_out` int(2),
   `p10` int(1),
   `p11` int(1),
   `p12` int(1),
   `p13` int(1),
   `p14` int(1),
   `p15` int(1),
   `p16` int(1),
   `p17` int(1),
   `p18` int(1),
   `p_in` int(2),
   `p_yht` int(2),
   `tasoituskierros` int(1),
   `uusi_tasoitus` decimal (4,1),
   `pelattu` int(1), # etuysi, takaysi, koko kierros
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;
CREATE UNIQUE INDEX jasen_kierros_idx ON kierros (jasennumero, pvm);
ALTER TABLE kierros ADD CONSTRAINT `key_tii` FOREIGN KEY (`kentta_id`,`tii_id`) REFERENCES `tii` (`kentta_id`,`tii_id`);
ALTER TABLE kierros ADD CONSTRAINT `key_jasen_seura` FOREIGN KEY (`jasenseura`,`jasennumero`) REFERENCES `pelaaja`  (`seura_id`,`jasennumero`); # ei ota päiväystä huomioon !!
alter table kierros change markitsija merkitsija varchar(50);

################
# PRIMARY KEY (`id`),
#  UNIQUE KEY `user_role_uk` (`user_id`,`role_id`),
#  KEY `user_role_fk2` (`role_id`),
#  CONSTRAINT `user_role_fk1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`),
#  CONSTRAINT `user_role_fk2` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`role_id`)



  


