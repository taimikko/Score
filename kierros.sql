CREATE TABLE kierros (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pvm` DATE NOT NULL DEFAULT "2000-01-01",
  `seura_id` int(11) NOT NULL DEFAULT '0',
  `jasennumero` int(11) NOT NULL DEFAULT '0',
  `kentta_id` int(11) DEFAULT '0',
  `tasoitus` decimal(4,1) NOT NULL,
  `tii_id` int(11) NOT NULL DEFAULT '0',  # 1,2,3 tai 48, 52, 56, 61
  `pelitasoitus` int(3) ,
  `cba` decimal(3,1) DEFAULT 0,
  `h1` int(3),
  `h2` int(3),
  `h3` int(3),
  `h4` int(3),
  `h5` int(3),
  `h6` int(3),
  `h7` int(3),
  `h8` int(3),
  `h9` int(3),
  `h_out` int(3),
  `h10` int(3),
  `h11` int(3),
  `h12` int(3),
  `h13` int(3),
  `h14` int(3),
  `h15` int(3),
  `h16` int(3),
  `h17` int(3),
  `h18` int(3),
  `h_in` int(3),
  `yhteensa` int(3),
  `merkitsija` varchar(50),
  `lisatieto` varchar(200),
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
  `p_yht` int(3),
  `tasoituskierros` int(1),
  `uusi_tasoitus` decimal (4,1),
  `pelattu` int(1), # etuysi, takaysi, koko kierros
  `etunimi` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  `sukunimi` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kierros_uk1` (`seura_id`,`jasennumero`,`pvm`)
) ENGINE=InnoDB ;

#ALTER TABLE kierros modify   `pelitasoitus` int(3);
#18.10.2018
#alter table kierros drop foreign key kierros_fk1;
#alter table kierros drop key kierros_uk1;
#alter table kierros add key kierros_uk1 (`seura_id`,`jasennumero`,`pvm`);
#ALTER TABLE kierros ADD CONSTRAINT `kierros_fk1` FOREIGN KEY (`seura_id`, `jasennumero`) REFERENCES `pelaaja` (`seura_id`, `jasennumero`);
#
# ennen:   `pvm` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
#ALTER TABLE kierros MODIFY   `pvm` DATE NOT NULL DEFAULT "2000-01-01";
# 23.10.2018
ALTER TABLE kierros ADD `etunimi`  varchar(50);
ALTER TABLE kierros ADD `sukunimi`  varchar(50);
# 13.11.2018
ALTER TABLE kierros DROP FOREIGN KEY `kierros_fk1`;




