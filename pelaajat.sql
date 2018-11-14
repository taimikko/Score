#INSERT INTO `pelaaja` (
#  `id` int(11) NOT NULL AUTO_INCREMENT,
#  `pvm` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
#  `seura_id` int(11) NOT NULL DEFAULT '0',
#  `jasennumero` int(11) NOT NULL DEFAULT '0',
#  `sukunimi` varchar(50) NOT NULL,
#  `etunimi` varchar(50) NOT NULL,
#  `sukup` int(1),
#  `jasen_tyyppi` int(11) NOT NULL,
#  `tasoitus` decimal(4,1) NOT NULL,
#  `tasoitus_voimassa` tinyint(1) NOT NULL,
#  PRIMARY KEY (`id`)

INSERT INTO pelaaja (id,pvm,seura_id,jasennumero,sukunimi,etunimi,sukup,jasen_tyyppi,tasoitus,tasoitus_voimassa) VALUES (null, null, 78, 1, "Pro", "Pekka", 1, 2, -2, 1);
INSERT INTO pelaaja (id,pvm,seura_id,jasennumero,sukunimi,etunimi,sukup,jasen_tyyppi,tasoitus,tasoitus_voimassa) VALUES (null, null, 78, 10000, "Aloittelija", "Aku", 1, 2, 52, 1);
INSERT INTO pelaaja (id,pvm,seura_id,jasennumero,sukunimi,etunimi,sukup,jasen_tyyppi,tasoitus,tasoitus_voimassa) VALUES (null, null, 78, 2, "Pro", "Paula", 2, 2, 0, 1);


INSERT INTO pelaaja (id,pvm,seura_id,jasennumero,sukunimi,etunimi,sukup,jasen_tyyppi,tasoitus,tasoitus_voimassa) VALUES (null, null, 78, 2566, "Saarinen", "Mikko", 1, 3, 13, 0);
INSERT INTO pelaaja (id,pvm,seura_id,jasennumero,sukunimi,etunimi,sukup,jasen_tyyppi,tasoitus,tasoitus_voimassa) VALUES (null, null, 78, 3007, "Saarinen", "S", 2, 2, 18, 1);

INSERT INTO pelaaja (id,pvm,seura_id,jasennumero,sukunimi,etunimi,sukup,jasen_tyyppi,tasoitus,tasoitus_voimassa) VALUES (null, null, 78, 3, "Järvenpää", "Kari", 1, 9, 0, 0);


INSERT INTO pelaaja (id,pvm,seura_id,jasennumero,sukunimi,etunimi,sukup,jasen_tyyppi,tasoitus,tasoitus_voimassa) VALUES (null, null, 78, 4, "Manager", "Manager", 1, 9, 0, 0);

INSERT INTO pelaaja (id,pvm,seura_id,jasennumero,sukunimi,etunimi,sukup,jasen_tyyppi,tasoitus,tasoitus_voimassa) VALUES (null, null, 78, 0, "DbAdmin1", "dbadmin1", 1, 9, 0, 0);

 alter table pelaaja drop sukup;
