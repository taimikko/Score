CREATE TABLE `rooli` (
  `rooli_id` int(11) NOT NULL,
  `rooli_nimi` varchar(30) NOT NULL,
  PRIMARY KEY (`rooli_id`),
  UNIQUE KEY `rooli_uk` (`rooli_nimi`)
) ENGINE=InnoDB;

INSERT INTO rooli (rooli_id, rooli_nimi) VALUES ( 1, "ROLE_ADMIN");
INSERT INTO rooli (rooli_id, rooli_nimi) VALUES ( 2, "ROLE_SEURA_MANAGER");
INSERT INTO rooli (rooli_id, rooli_nimi) VALUES ( 3, "ROLE_PELAAJA"); 

CREATE TABLE `Persistent_Logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB;


CREATE TABLE `kayttaja` (
  `kayttaja_id` int(11) NOT NULL AUTO_INCREMENT,
  `kayttajatunnus` varchar(36) NOT NULL,
  `encryted_password` varchar(128) NOT NULL,
  `enabled` bit(1) NOT NULL,
  seura_id int(11) NOT NULL,
  jasennumero int(11) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `etunimi` varchar(50) NOT NULL,
  PRIMARY KEY (`kayttaja_id`),
  UNIQUE KEY kayttaja_uk1 (kayttajatunnus),
  UNIQUE KEY kayttaja_uk2 (seura_id, jasennumero),
  CONSTRAINT kayttaja_fk1 FOREIGN KEY (seura_id, jasennumero) REFERENCES pelaaja (seura_id, jasennumero)
) ENGINE=InnoDB;

ALTER TABLE kayttaja DROP FOREIGN KEY kayttaja_fk1;
# 12.10.2018 sukup siirretty pelaajalta käyttäjälle
ALTER TABLE kayttaja ADD `sukup` int(1);
update kayttaja set sukup=1;
#15.10.2018 enabled -kentässsä NULL -> false
alter table kayttaja modify enabled bit(1) NOT NULL DEFAULT false;
# 30.10.2018 jäsenyyden tyyppi siirretty pelaajalta tänne
alter table kayttaja add   `jasen_tyyppi` int(11) NOT NULL;
update kayttaja set jasen_tyyppi=1;
ALTER TABLE kayttaja ADD CONSTRAINT `key_jasen_tyyppi` FOREIGN KEY (`jasen_tyyppi`) REFERENCES `jasen_tyyppi` (`id`);



# update kayttaja k, pelaaja p set k.etunimi = p.etunimi where k.seura_id = p.seura_id and k.jasennumero = p.jasennumero;
# update kayttaja k, pelaaja p set k.sukunimi = p.sukunimi where k.seura_id = p.seura_id and k.jasennumero = p.jasennumero;


#INSERT INTO kayttaja (kayttaja_id, kayttajatunnus, encryted_password, enabled, seura_id, jasennumero, etunimi, sukunimi) VALUES (null, "msa", "x",true, 78, 2566, "Mikko", "Saarinen"); 
INSERT INTO kayttaja (kayttaja_id, kayttajatunnus, encryted_password, enabled, seura_id, jasennumero, etunimi, sukunimi) VALUES (null, "pro", "x",true, 78, 1, "Pekka", "Pro"); 
INSERT INTO kayttaja (kayttaja_id, kayttajatunnus, encryted_password, enabled, seura_id, jasennumero, etunimi, sukunimi) VALUES (null, "a", "x",true, 78, 10000, "Antti", "Alkaja"); 
INSERT INTO kayttaja (kayttaja_id, kayttajatunnus, encryted_password, enabled, seura_id, jasennumero, etunimi, sukunimi) VALUES (null, "p", "x",true, 78, 2, "Paula", "Pro"); 
INSERT INTO kayttaja (kayttaja_id, kayttajatunnus, encryted_password, enabled, seura_id, jasennumero, etunimi, sukunimi) VALUES (null, "s", "x",true, 78, 3007, "S", "Saarinen"); 
INSERT INTO kayttaja (kayttaja_id, kayttajatunnus, encryted_password, enabled, seura_id, jasennumero, etunimi, sukunimi) VALUES (null, "j", "x",true, 78, 3, "Kari", "Järvenpää"); 
INSERT INTO kayttaja (kayttaja_id, kayttajatunnus, encryted_password, enabled, seura_id, jasennumero, etunimi, sukunimi) VALUES (null, "m", "x",true, 78, 4, "Manager", "Manager"); 
INSERT INTO kayttaja (kayttaja_id, kayttajatunnus, encryted_password, enabled, seura_id, jasennumero, etunimi, sukunimi) VALUES (null, "dbadmin1", "$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu ",true, 78, 0,"dbadmin1", "dbadmin1"); 


CREATE TABLE `kayttaja_rooli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kayttaja_id` int(11) NOT NULL,
  `rooli_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kayttaja_rooli_uk` (`kayttaja_id`,`rooli_id`),
  KEY `kayttaja_rooli_fk2` (`rooli_id`),
  CONSTRAINT `kayttaja_rooli_fk1` FOREIGN KEY (`kayttaja_id`) REFERENCES `kayttaja` (`kayttaja_id`) ON DELETE CASCADE,
  CONSTRAINT `kayttaja_rooli_fk2` FOREIGN KEY (`rooli_id`) REFERENCES `rooli` (`rooli_id`)
) ENGINE=InnoDB;


# kayttaja_id  kayttajatunnus  seura_id  jasennumero 
#           1  pro                   78            1 
#           2  a                     78        10000 
#           3  p                     78            2 
#           4  s                     78         3007 
#           5  j                     78            3 
#           7  m                     78            4 
#           8  dbadmin1              78            0 

# rooli_id  rooli_nimi         
#        1  ROLE_ADMIN         
#        3  ROLE_PELAAJA       
¤        2  ROLE_SEURA_MANAGER 


#INSERT INTO kayttaja_rooli (id, kayttaja_id, rooli_id) VALUES (null, "msa", "x",true, 78, 2566); 
INSERT INTO kayttaja_rooli (id, kayttaja_id, rooli_id) VALUES (null, 1, 3); 
INSERT INTO kayttaja_rooli (id, kayttaja_id, rooli_id)  VALUES (null, 2, 3);
INSERT INTO kayttaja_rooli (id, kayttaja_id, rooli_id)  VALUES (null, 3, 3);
INSERT INTO kayttaja_rooli (id, kayttaja_id, rooli_id)  VALUES (null, 4, 3);
INSERT INTO kayttaja_rooli (id, kayttaja_id, rooli_id)  VALUES (null, 5, 3);
INSERT INTO kayttaja_rooli (id, kayttaja_id, rooli_id)  VALUES (null, 7, 2);
INSERT INTO kayttaja_rooli (id, kayttaja_id, rooli_id)  VALUES (null, 8, 1);


insert into kayttaja_rooli values(null,8,2);
insert into kayttaja_rooli values(null,8,3);
insert into kayttaja_rooli values(null,7,3);


