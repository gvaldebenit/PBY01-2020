--Borrado de Secuencias
DROP SEQUENCE seq_nvl_educ;
DROP SEQUENCE seq_region;
DROP SEQUENCE seq_comuna;
DROP SEQUENCE seq_banco;
DROP SEQUENCE seq_est_civil;
DROP SEQUENCE seq_parentezco;
DROP SEQUENCE seq_tramoahorro;
DROP SEQUENCE seq_tramoedad;
DROP SEQUENCE seq_tramoestado;
DROP SEQUENCE seq_tramoviv;
DROP SEQUENCE seq_viviendas;
DROP SEQUENCE seq_domicilio;
DROP SEQUENCE seq_ahorro;
DROP SEQUENCE seq_deposito;
DROP SEQUENCE seq_inf_tec;
DROP SEQUENCE seq_folio;

--Poblado TABLAS REFERENCIA

--Tabal Nivel Educacional

CREATE SEQUENCE seq_nvl_educ;
INSERT INTO nvl_educ VALUES(seq_nvl_educ.NEXTVAL, 'Básica Incompleta');
INSERT INTO nvl_educ VALUES(seq_nvl_educ.NEXTVAL, 'Básica Completa');
INSERT INTO nvl_educ VALUES(seq_nvl_educ.NEXTVAL, 'Media Incompleta');
INSERT INTO nvl_educ VALUES(seq_nvl_educ.NEXTVAL, 'Media Completa');
INSERT INTO nvl_educ VALUES(seq_nvl_educ.NEXTVAL, 'Media Nivel Técnico');
INSERT INTO nvl_educ VALUES(seq_nvl_educ.NEXTVAL, 'Superior Técnica Incompleta');
INSERT INTO nvl_educ VALUES(seq_nvl_educ.NEXTVAL, 'Superior Técnica Completa');
INSERT INTO nvl_educ VALUES(seq_nvl_educ.NEXTVAL, 'Superior Incompleta');
INSERT INTO nvl_educ VALUES(seq_nvl_educ.NEXTVAL, 'Superior Completa');

-- Tabla REGION

CREATE SEQUENCE seq_region START WITH 10 INCREMENT BY 10; 
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de Tarapacá');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de Antofagasta');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de Atacama');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de Coquimbo');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de Valparaiso');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de OHiggins');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región del Maule');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región del Bio-Bio');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de la Araucania');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de los Lagos');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de Aysén');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de Magallanes');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Region Metropolitana');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de los Ríos');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de Arica y Parinacota');
INSERT INTO region VALUES (seq_region.NEXTVAL,'Región de Ñuble');

--Tabla COMUNAS

CREATE SEQUENCE seq_comuna ;
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'Santiago',130);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'Macul',130);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'Puente Alto',130);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'Providencia',130);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'La Serena',40);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'La Huiguera',40);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'Arica',150);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'Putre',150);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'Alto Hospicio',10);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'Pozo Almonte',10);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'Aysén',110);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'Chile Chico',110);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'Punta Arenas',120);
INSERT INTO comuna VALUES (seq_comuna.NEXTVAL,'Puerto Natales',120);

-- Tabla BANCO

CREATE SEQUENCE seq_banco;
INSERT INTO banco VALUES (seq_banco.NEXTVAL,'Banco de Créditos e Inversiones');
INSERT INTO banco VALUES (seq_banco.NEXTVAL,'Banco Estado');
INSERT INTO banco VALUES (seq_banco.NEXTVAL,'Banco de Chile');
INSERT INTO banco VALUES (seq_banco.NEXTVAL,'Scotiabank');
INSERT INTO banco VALUES (seq_banco.NEXTVAL,'Banco Santander');
INSERT INTO banco VALUES (seq_banco.NEXTVAL,'Banco Itaú');

--Tabla ESTADO CIVIL

CREATE SEQUENCE seq_est_civil START WITH 10 INCREMENT BY 10;
INSERT INTO est_civil VALUES (seq_est_civil.NEXTVAL,'Soltero');
INSERT INTO est_civil VALUES (seq_est_civil.NEXTVAL,'Casado');
INSERT INTO est_civil VALUES (seq_est_civil.NEXTVAL,'Viudo');
INSERT INTO est_civil VALUES (seq_est_civil.NEXTVAL,'Divorciado');
INSERT INTO est_civil VALUES (seq_est_civil.NEXTVAL,'Conviviente Civil');

--Tabla parentezco

CREATE SEQUENCE seq_parentezco;
INSERT INTO parentezco VALUES (seq_parentezco.NEXTVAL,'Conviviente');
INSERT INTO parentezco VALUES (seq_parentezco.NEXTVAL,'Hijo');
INSERT INTO parentezco VALUES (seq_parentezco.NEXTVAL,'Hijastro');
INSERT INTO parentezco VALUES (seq_parentezco.NEXTVAL,'Sobrino');
INSERT INTO parentezco VALUES (seq_parentezco.NEXTVAL,'Primo');
INSERT INTO parentezco VALUES (seq_parentezco.NEXTVAL,'Hermano');
INSERT INTO parentezco VALUES (seq_parentezco.NEXTVAL,'Hermanastro');

--Tablas PUNTAJES

CREATE SEQUENCE seq_tramoahorro;
INSERT INTO tramo_pje_ahorro VALUES (seq_tramoahorro.NEXTVAL,8000000,8999999,200);
INSERT INTO tramo_pje_ahorro VALUES (seq_tramoahorro.NEXTVAL,9000000,10000000,400);
INSERT INTO tramo_pje_ahorro VALUES (seq_tramoahorro.NEXTVAL,10000001,100000000,500);
------
CREATE SEQUENCE seq_tramoestado;
INSERT INTO tramo_pje_ecivil VALUES (seq_tramoestado.NEXTVAL,10,60);
INSERT INTO tramo_pje_ecivil VALUES (seq_tramoestado.NEXTVAL,20,100);
INSERT INTO tramo_pje_ecivil VALUES (seq_tramoestado.NEXTVAL,30,20);
INSERT INTO tramo_pje_ecivil VALUES (seq_tramoestado.NEXTVAL,40,40);
INSERT INTO tramo_pje_ecivil VALUES (seq_tramoestado.NEXTVAL,50,80);
-----
CREATE SEQUENCE seq_tramoedad;
INSERT INTO tramo_pje_edad VALUES (seq_tramoedad.NEXTVAL,1,29,200);
INSERT INTO tramo_pje_edad VALUES (seq_tramoedad.NEXTVAL,30,40,150);
INSERT INTO tramo_pje_edad VALUES (seq_tramoedad.NEXTVAL,41,150,100);
-----
CREATE SEQUENCE seq_tramoviv;
INSERT INTO tramo_viv VALUES (seq_tramoviv.NEXTVAL,1,1800);
INSERT INTO tramo_viv VALUES (seq_tramoviv.NEXTVAL,1801,2400);
INSERT INTO tramo_viv VALUES (seq_tramoviv.NEXTVAL,2401,2800);

--Tabla POSTULANTE

INSERT INTO postulante VALUES ('10481082-5','Gertrudis Amalia','Abello','Godoy',TO_DATE('7/abril/1985'),
                                'Chilena',null,10,9,'Medicina','Universidad Andres Bello',0,
                                null,null, EMPTY_BLOB(),EMPTY_BLOB(),
                                '0273564226','0258913136','g.abello.g@gmail.com','09941275');
                                
INSERT INTO postulante VALUES ('12766479-K','Anibal José','Pinto','Miranda', TO_DATE('19/Junio/1975'),
                                'Chilena',null,20,9,'Ingenerio Informatica','Duoc Uc',0,
                                null,null, EMPTY_BLOB(),EMPTY_BLOB(),
                                '0281334726','02123578136','Anibal.p.m@gmail.com','09631985');

INSERT INTO postulante VALUES ('16689082-5','Yandel Ignacio','Perez','Gonzalez', TO_DATE('9/Septiembre/1982'),
                                'Chilena',null,20,9,'Diseñador Grafico','Universidad Mayor',0,
                                null,null, EMPTY_BLOB(),EMPTY_BLOB(),
                                '0299846471','02198768','Wyandel@gmail.com','09965215');

INSERT INTO postulante VALUES ('13461281-6','Silvio Eustaquio','Peña','Gutierrez',TO_DATE('1/Marzo/1973'),
                                'Chilena',null,20,9,'Tecnologo Medico','Universidad de las Americas',0,
                                null,null, EMPTY_BLOB(),EMPTY_BLOB(),
                                '028133476','02123576','Silvio.Peña@gmail.com','0964993');
                                
INSERT INTO postulante VALUES ('11771982-K','Florencio Marino','Suazo','Riquelme',TO_DATE('8/Agosto/1963'),
                                'Chilena',null,20,9,'Ingenieria Comercial','Universidad de Chile',0,
                                null,null, EMPTY_BLOB(),EMPTY_BLOB(),
                                '02567982','02987152','Florencio.s.r@gmail.com','09724982');
                                
INSERT INTO postulante VALUES ('16551678-5','Hugo Luis','Muñoz','Figueroa',TO_DATE('15/Enero/1989'),
                                'Chilena',null,10,9,'Ingenieria Civil Industrial','Universidad Catolica',0,
                                null,null, EMPTY_BLOB(),EMPTY_BLOB(),
                                '02545322','02989715','Hugo1989@gmail.com','09227894');
                                
INSERT INTO postulante VALUES ('17521182-1','Carmela Rosa','Osses','Ramirez', TO_DATE('5/Febrero/1990'),
                                'Chilena',null,10,9,'Medicina','Universidad de las Americas',0,
                                null,null, EMPTY_BLOB(),EMPTY_BLOB(),
                                '02545322','02989715','Carmelita@gmail.com','09227894');                                

INSERT INTO postulante VALUES ('18441082-5','Martiniano Leonardo','Quilodran','Hernandez',TO_DATE('7/Mayo/1993'),
                                'Chilena',null,10,9,'Derecho','Universidad de Chile',0,
                                null,NULL, EMPTY_BLOB(),EMPTY_BLOB(),
                                '02215692','02989635','marcianoquild@gmail.com','09785192');    
                                
INSERT INTO postulante VALUES ('16433082-1','Abelardo Ian','Reyes','Chavez',TO_DATE('18/Octubre/1989'),
                                'Chilena',null,30,9,'Psicologia','Universidad de las Americas',0,
                                null,null, EMPTY_BLOB(),EMPTY_BLOB(),
                                '02545322','02989715','Aberlard.reyes@gmail.com','09227894'); 
                                
INSERT INTO postulante VALUES ('17644082-K','Prosperina Lea','Quiroz','Chavez',TO_DATE('14/Diciembre/1992'),
                                'Chilena',null,10,9,'Ingenieria Industrial','Universidad de Chile',0,
                                null,null, EMPTY_BLOB(),EMPTY_BLOB(),
                                '02545322','02989715','Propsera_quiroz@gmail.com','09227894');         
                                

--Tabla CARGAS       

INSERT INTO carga VALUES ('25441575-K','Yandel','Perez','Gonzalez','16689082-5',2);
INSERT INTO carga VALUES ('26671879-1','Wisin','Perez','Gonzalez','16689082-5',2);
INSERT INTO carga VALUES ('23453121-1','Yankee','Perez','Gonzalez','16689082-5',2);
INSERT INTO carga VALUES ('18441575-5','Nicolas','Reyes','Dias','16433082-1',2);
INSERT INTO carga VALUES ('19552121-6','Alejandro','Suazo','Alveal','11771982-K',2);
INSERT INTO carga VALUES ('21859791-K','javier','Quilodran','Miranda','18441082-5',3);

--Tabla CONYUGE

INSERT INTO conyuge VALUES ('17550453-K','Becky Lea','Gonzalez','Perez','Chilena',TO_DATE('19/Diciembre/1988'),'16689082-5');
INSERT INTO conyuge VALUES ('15950173-1','Alejandra Javiera','Dias','Chavez','Chilena',TO_DATE('20/Enero/1984'),'16433082-1');
INSERT INTO conyuge VALUES ('16983177-5','Valentina Leandra','Alveal','Ahumada','Chilena',TO_DATE('27/Abril/1981'),'11771982-K');
INSERT INTO conyuge VALUES ('17977189-1','Constanza María','Miranda','Perez','Chilena',TO_DATE('20/Enero/1990'),'18441082-5');
INSERT INTO conyuge VALUES ('12675987-K','Almendra Rosa','Perez','Perez','Chilena',TO_DATE('11/Noviembre/1977'),'12766479-K');
INSERT INTO conyuge VALUES ('14979642-8','Esperanza Luz','Ortega','Nuñez','Chilena',TO_DATE('15/Enero/1978'),'13461281-6');

--Tabla PROPIETARIOS

INSERT INTO propietario VALUES ('12165324-9','Ana Lahuel Maicalla','2267348','anitalahue@gmail.com');
INSERT INTO propietario VALUES ('14385139-K','Guillermo Nelilla Osas','4562398','guillermon@gmail.com');
INSERT INTO propietario VALUES ('18441575-5','Sebastian Lorca Medina','45512816','sebastardo@gmail.com');
INSERT INTO propietario VALUES ('10165921-9','Juan Rain Nuñez','55326348','taelaojuan@gmail.com');
INSERT INTO propietario VALUES ('15842314-5','Ignacio Silva Alveal','6789532','nachoalve@gmail.com');
INSERT INTO propietario VALUES ('12765836-6','Manuel Manns Ossa','56772983','emannuel@gmail.com');
INSERT INTO propietario VALUES ('1599973-K','Joaquin Fuentes Nuñez','963527821','Joako@gmail.com');
INSERT INTO propietario VALUES ('1499189-9','German Muñoz Garmendia','98764321','holasoyger@gmail.com');
INSERT INTO propietario VALUES ('1312413-1','Patricio Infante Lorca','91724329','patocarlos@gmail.com');
INSERT INTO propietario VALUES ('1105913-9','Andrea Plazas Barrientos','98769926','Andreita@gmail.com');

--Tabla VIVIENDAS

CREATE SEQUENCE seq_viviendas START WITH 10 INCREMENT BY 10;
INSERT INTO vivienda VALUES (seq_viviendas.NEXTVAL,'12165324-9','Casa','Av.Matta 920',null, null,'573-24','Huemul','108','20/Marzo/2019',140,2010,'920','22/abril/2019',1);
INSERT INTO vivienda VALUES (seq_viviendas.NEXTVAL,'14385139-K','Casa','Av.Macul 320',null, null,'598-33','Juan Pinto Duran','278','10/Enero/2019',660,2011,'77','2/Septiembre/2019',2);
INSERT INTO vivienda VALUES (seq_viviendas.NEXTVAL,'18441575-5','Casa','Villa Industrial Papelera 512',null,null,'778-13','Las Garzas','97','19/Septiembre/2019',60,2011,'107','2/Octubre/2019',3);
INSERT INTO vivienda VALUES (seq_viviendas.NEXTVAL,'10165921-9','Departamento','Av.Providencia 220',220,2,'598-33','Los Leones','88','10/Octubre/2019',770,2011,'881','2/Diciembre/2019',4);
INSERT INTO vivienda VALUES (seq_viviendas.NEXTVAL,'15842314-5','Departamento','Av.La Serena 880',33,3,'666-93','11 de Septiembre','108','15/Febrero/2019',743,2011,'97','2/Junio/2019',5);
INSERT INTO vivienda VALUES (seq_viviendas.NEXTVAL,'12765836-6','Casa','Av.Marta Brunet 450',null,null,'128-88','Carmen Gloria','798','25/Octubre/2019',660,2011,'77','22/Septiembre/2019',7);
INSERT INTO vivienda VALUES (seq_viviendas.NEXTVAL,'1599973-K','Casa','Av.Salvador Allende 50',null,null,'598-33','Linares','889','18/Noviembre/2019',545,2011,'99','2/Noviembre/2019',6);
INSERT INTO vivienda VALUES (seq_viviendas.NEXTVAL,'1499189-9','Casa','Av.Rojas Magallanes 993',null,null,'678-77','Jardin Alto','78','20/Enero/2019',321,2011,'215','2/Julio/2019',10);
INSERT INTO vivienda VALUES (seq_viviendas.NEXTVAL,'1312413-1','Casa','Av.Grecia 658',null,null,'185-311','Altiplano','45','26/Septiembre/2019',872,2011,'345','29/Octubre/2019',12);
INSERT INTO vivienda VALUES (seq_viviendas.NEXTVAL,'1105913-9','Casa','Av.Presidente Kennedy 753',null,null,'667-99','Los Hurones','108','19/Enero/2019',660,2011,'122','2/Noviembre/2019',14);

--Tabla DOMICILIO

CREATE SEQUENCE seq_domicilio;
INSERT INTO domicilio VALUES (seq_domicilio.NEXTVAL,'10481082-5','Manuel Carvallo',55,null,null,null,null,'Las Perdices','Lo Hermida',3830000,9);
INSERT INTO domicilio VALUES (seq_domicilio.NEXTVAL,'12766479-K','Carmen ',5275,3,92,null,null,'Condor','Centenario',7650258,2);
INSERT INTO domicilio VALUES (seq_domicilio.NEXTVAL,'16689082-5','Trinidad',467,4,15,null,null,'La Florida','Los Copihues',7790751,3);
INSERT INTO domicilio VALUES (seq_domicilio.NEXTVAL,'13461281-6','Los Dominicos',566,2,115,null,null,null,'Jardin El Sauce',7591538,11);
INSERT INTO domicilio VALUES (seq_domicilio.NEXTVAL,'11771982-K','17 de Marzo',78,null,null,null,null,'Las Perdices','Villa el Alba',8010000,6);
INSERT INTO domicilio VALUES (seq_domicilio.NEXTVAL,'16551678-5','Aguas Abajo',355,null,null,null,null,'Las Perdices','Villa San Carlos',8181753,12);
INSERT INTO domicilio VALUES (seq_domicilio.NEXTVAL,'17521182-1','Las Nubes',4050,null,null,null,null,'Las Perdices','Villa Lo Torconal',9060692,13);
INSERT INTO domicilio VALUES (seq_domicilio.NEXTVAL,'18441082-5','Palermo',365,null,null,null,null,'Las Perdices','Villa Chiloé',9250000,3);
INSERT INTO domicilio VALUES (seq_domicilio.NEXTVAL,'16433082-1','Armando Moock',555,null,null,null,null,'Las Perdices','Villa Nueva Quilín',8940000,3);
INSERT INTO domicilio VALUES (seq_domicilio.NEXTVAL,'17644082-K','Arturo Prat',987,null,null,null,null,'Las Perdices', 'San Juan de Macul',8700000,2);

--Tabla AHORRO

CREATE SEQUENCE seq_ahorro;
INSERT INTO ahorro VALUES (seq_ahorro.NEXTVAL,'1234567892','10481082-5','Postulante','Cuenta Vista','9500000',6);
INSERT INTO ahorro VALUES (seq_ahorro.NEXTVAL,'2784939716','12766479-K','Postulante','Cuenta Corriente','8500000',4);
INSERT INTO ahorro VALUES (seq_ahorro.NEXTVAL,'1895364789','16689082-5','Postulante','Cuenta Ahorro','9000000',3);
INSERT INTO ahorro VALUES (seq_ahorro.NEXTVAL,'1936717394','13461281-6','Postulante','Cuenta Vista','15000000',6);
INSERT INTO ahorro VALUES (seq_ahorro.NEXTVAL,'1829474637','11771982-K','Postulante','Cuenta Vista','12000000',1);
INSERT INTO ahorro VALUES (seq_ahorro.NEXTVAL,'1937426748','16551678-5','Postulante','Cuenta Corriente','16000000',3);
INSERT INTO ahorro VALUES (seq_ahorro.NEXTVAL,'1354257394','17521182-1','Postulante','Cuenta Ahorro','8000000',4);
INSERT INTO ahorro VALUES (seq_ahorro.NEXTVAL,'1578392039','18441082-5','Postulante','Cuenta Vista','8200000',5);
INSERT INTO ahorro VALUES (seq_ahorro.NEXTVAL,'1638297483','16433082-1','Postulante','Cuenta Ahorro','9700000',2);
INSERT INTO ahorro VALUES (seq_ahorro.NEXTVAL,'122387427','17644082-K','Postulante','Cuenta Corriente','9530000',5);

--Tabla DEPOSITO

CREATE SEQUENCE seq_deposito;
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,1,1000000,'19/Abril/2019','Banco Scotiabank');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,1,5000000,'5/Julio/2019','Banco Scotiabank');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,2,500000,'1/Marzo/2017','Banco Itau');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,2,500000,'28/Enero/2019','Banco Itau');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,3,1200000,'9/Julio/2019','Banco Estado');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,3,1000000,'19/Septiembre/2019','Banco Estado');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,4,1000000,'19/Diciembre/2018','Banco Scotiabank');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,4,2000000,'10/Enero/2020','Banco Scotiabank');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,5,1000000,'19/abril/2019','Banco Bci');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,5,200000,'5/Octubre/2018','Banco Bci');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,6,1000000,'10/Noviembre/2018','Banco Estado');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,6,1000000,'8/Octubre/2018','Banco Estado');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,7,1000000,'19/Agosto/2019','Banco Itau');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,7,1000000,'19/Junio/2019','Banco Itau');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,8,500000,'19/Septiembre/2019','Banco Santander');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,8,500000,'19/Octubre/2020','Banco Santander');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,9,1000000,'25/Marzo/2019','Banco de Chile');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,9,1000000,'19/abril/2019','Banco de Chile');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,10,500000,'4/Enero/2019','Banco Santander');
INSERT INTO deposito VALUES (seq_deposito.NEXTVAL,10,500000,'19/Marzo/2019','Banco Santander');

--Tabla EVALUADOR

INSERT INTO evaluador VALUES ('17077264-3','Antonio Medina Campos','98764321','toño@gmail.com',3138,'Primera',1596,'17/03/2017');
INSERT INTO evaluador VALUES ('18451924-1','Yendelin Zuñiga Muñoz','94518391','thuxyendel@gmail.com',3136,'Segunda',1596,'17/03/2017');
INSERT INTO evaluador VALUES ('17177264-3','Freddy Lorca Pizarro','91275221','fr.campos@gmail.com',3145,'Tercera',1596,'17/03/2017');
INSERT INTO evaluador VALUES ('11959885-0','Carmen Chaparro Mena','95734391','carmen@gmail.com',3146,'Cuarta',1596,'17/03/2017');
INSERT INTO evaluador VALUES ('15494012-K','Enrique Prieto Salgado','97732329','Enri@gmail.com',3153,'Primera',1596,'17/03/2017');
INSERT INTO evaluador VALUES ('16858215-1','Paula Jara Concha','99554344','Pau@gmail.com',3154,'Secunda',1596,'17/03/2017');
INSERT INTO evaluador VALUES ('16438381-8','Ana Tolosa Morales','95542311','Anita@gmail.com',3163,'tercera',1596,'17/03/2017');
INSERT INTO evaluador VALUES ('19481294-5','Manuel Toro Morales','98844591','Emmanuel@gmail.com',3164,'Primera',1596,'17/03/2017');

--Tabla Informe TECNICO

CREATE SEQUENCE seq_inf_tec;
INSERT INTO inf_tecnico VALUES(seq_inf_tec.NEXTVAL, 'BUENA',  0, 2, 1, 1, 10); 
INSERT INTO inf_tecnico VALUES(seq_inf_tec.NEXTVAL, 'BUENA',  0, 3, 1, 1, 20);
INSERT INTO inf_tecnico VALUES(seq_inf_tec.NEXTVAL, 'BUENA',  0, 0, 1, 1, 30);
INSERT INTO inf_tecnico VALUES(seq_inf_tec.NEXTVAL, 'BUENA',  0, 0, 1, 1, 40);
INSERT INTO inf_tecnico VALUES(seq_inf_tec.NEXTVAL, 'BUENA',  0, 2, 1, 1, 50);
INSERT INTO inf_tecnico VALUES(seq_inf_tec.NEXTVAL, 'BUENA',  0, 1, 1, 1, 60);
INSERT INTO inf_tecnico VALUES(seq_inf_tec.NEXTVAL, 'BUENA',  0, 3, 1, 1, 70);
INSERT INTO inf_tecnico VALUES(seq_inf_tec.NEXTVAL, 'BUENA',  0, 1, 1, 1, 80);
INSERT INTO inf_tecnico VALUES(seq_inf_tec.NEXTVAL, 'BUENA',  0, 2, 1, 1, 90);
INSERT INTO inf_tecnico VALUES(seq_inf_tec.NEXTVAL, 'BUENA',  0, 1, 1, 1, 100);

--Tabla Par EVALUADOR

INSERT INTO par_evaluador VALUES('17077264-3', 1);
INSERT INTO par_evaluador VALUES('18451924-1', 1);
INSERT INTO par_evaluador VALUES('17077264-3', 2);
INSERT INTO par_evaluador VALUES('18451924-1', 2);
INSERT INTO par_evaluador VALUES('17077264-3', 3);
INSERT INTO par_evaluador VALUES('18451924-1', 3);
INSERT INTO par_evaluador VALUES('17077264-3', 4);
INSERT INTO par_evaluador VALUES('18451924-1', 4);
INSERT INTO par_evaluador VALUES('17077264-3', 5);
INSERT INTO par_evaluador VALUES('17177264-3', 5);
INSERT INTO par_evaluador VALUES('11959885-0', 6);
INSERT INTO par_evaluador VALUES('17177264-3', 6);
INSERT INTO par_evaluador VALUES('15494012-K', 7);
INSERT INTO par_evaluador VALUES('16858215-1', 7);
INSERT INTO par_evaluador VALUES('15494012-K', 8);
INSERT INTO par_evaluador VALUES('16858215-1', 8);
INSERT INTO par_evaluador VALUES('16438381-8', 9);
INSERT INTO par_evaluador VALUES('19481294-5', 9);
INSERT INTO par_evaluador VALUES('16438381-8', 10);
INSERT INTO par_evaluador VALUES('19481294-5', 10);

--Tabla FICHA

CREATE SEQUENCE seq_folio START WITH 10 INCREMENT BY 10;
INSERT INTO ficha VALUES(seq_folio.NEXTVAL, '15/04/2020', 'José Medina Quiroz', 2, 2000, 1, 10, 1, 1, 0, 1);
INSERT INTO ficha VALUES(seq_folio.NEXTVAL, '15/04/2020', 'Pablete Lorca Medina', 2, 2000, 1, 10, 2, 1, 0, 1);
INSERT INTO ficha VALUES(seq_folio.NEXTVAL, '15/04/2020', 'Pablete Lorca Medina', 1, 1700, 2, 30, 3, 1, 0, 1);
INSERT INTO ficha VALUES(seq_folio.NEXTVAL, '15/04/2020', 'Javiera Pereira Lama', 2, 2000, 12, 90, 4, 1, 0, 1);
INSERT INTO ficha VALUES(seq_folio.NEXTVAL, '15/04/2020', 'Javiera Pereira Lama', 1, 1700, 14, 100, 5, 1, 0, 1);
INSERT INTO ficha VALUES(seq_folio.NEXTVAL, '15/04/2020', 'Sofia Nahuel Toro', 2, 2000, 7, 60, 6, 1, 0, 1);
INSERT INTO ficha VALUES(seq_folio.NEXTVAL, '15/04/2020', 'Sofia Nahuel Toro', 1, 1700, 10, 80, 7, 1, 0, 1);
INSERT INTO ficha VALUES(seq_folio.NEXTVAL, '15/04/2020', 'Alberto Quiroz Lopez', 2, 2000, 4, 40, 8, 1, 0, 1);
INSERT INTO ficha VALUES(seq_folio.NEXTVAL, '15/04/2020', 'Alberto Quiroz Lopez', 3, 2500, 5, 50, 9, 1, 0, 1);
INSERT INTO ficha VALUES(seq_folio.NEXTVAL, '15/04/2020', 'Paula Jaraquemada Lara', 1, 1700, 14, 100, 10, 1, 0, 1);

--Tabla Postulación

INSERT INTO postulacion VALUES('10481082-5', 10);
INSERT INTO postulacion VALUES('12766479-K', 20);
INSERT INTO postulacion VALUES('16689082-5', 30);
INSERT INTO postulacion VALUES('13461281-6', 40);
INSERT INTO postulacion VALUES('11771982-K', 50);
INSERT INTO postulacion VALUES('16551678-5', 60);
INSERT INTO postulacion VALUES('17521182-1', 70);
INSERT INTO postulacion VALUES('18441082-5', 80);
INSERT INTO postulacion VALUES('16433082-1', 90);
INSERT INTO postulacion VALUES('17644082-K', 100);

--Inserción de datos tipo BLOB

--Creación Directorios

CREATE OR REPLACE DIRECTORY OBJ_FOTO AS 'C:\Users\Yhodarks\Desktop\Nueva carpeta (3)\Cara\';
GRANT READ, WRITE ON DIRECTORY OBJ_FOTO TO SUBSIDIO;

CREATE OR REPLACE DIRECTORY OBJ_FIRMA AS 'C:\Users\Yhodarks\Desktop\Nueva carpeta (3)\Firma\';
GRANT READ, WRITE ON DIRECTORY OBJ_FIRMA TO SUBSIDIO;

CREATE OR REPLACE DIRECTORY OBJ_DOC AS 'C:\Users\Yhodarks\Desktop\Nueva carpeta (3)\Docs\';
GRANT READ, WRITE ON DIRECTORY OBJ_DOC TO SUBSIDIO;

--SEQUENCE ERRORES INSERSION
DROP SEQUENCE seq_error;
CREATE SEQUENCE seq_error;
/

--Inserción de Datos. Usaremos un SP

CREATE OR REPLACE PROCEDURE sp_ins_fotos(p_rut VARCHAR)
IS
  v_blob_c  BLOB;
  v_blob_f  BLOB;
  v_bfile_c BFILE;
  v_bfile_f BFILE;
  v_foto    VARCHAR2(45);
  v_firma   VARCHAR2(45);
  v_msj     VARCHAR2(200);
  v_msj_err VARCHAR2(200);
BEGIN
    BEGIN
        v_foto := p_rut || '.jpg';
        SELECT p.cara 
          INTO v_blob_c
          FROM postulante p
         WHERE p.rut_p = p_rut FOR UPDATE;
        v_bfile_c := bfilename('OBJ_FOTO',v_foto);
        DBMS_LOB.OPEN(v_bfile_c, DBMS_LOB.LOB_READONLY);
        DBMS_LOB.LOADFROMFILE(v_blob_c, v_bfile_c, DBMS_LOB.GETLENGTH(v_bfile_c));
        DBMS_LOB.CLOSE(v_bfile_c);
    EXCEPTION
        WHEN OTHERS THEN
            v_msj := 'ERROR AL INTENTAR INSERTAR FOTO de POSTULANTE ' || p_rut;
            v_msj_err := sqlerrm;
            INSERT INTO errores_insersiones 
            VALUES (seq_error.NEXTVAL, v_msj, v_msj_err);  
    END;
    -------------------------------------------------------------------------------
    BEGIN
        v_firma := p_rut || '.jpg';
        SELECT p.firma
          INTO v_blob_f
          FROM postulante p
         WHERE p.rut_p = p_rut FOR UPDATE;
        v_bfile_f := bfilename('OBJ_FIRMA',v_firma);
        DBMS_LOB.OPEN(v_bfile_f, DBMS_LOB.LOB_READONLY);
        DBMS_LOB.LOADFROMFILE(v_blob_f, v_bfile_f, DBMS_LOB.GETLENGTH(v_bfile_f));
        DBMS_LOB.CLOSE(v_bfile_f);
	EXCEPTION
        WHEN OTHERS THEN
            v_msj := 'ERROR AL INTENTAR INSERTAR FIRMA de POSTULANTE ' || p_rut;
            v_msj_err := sqlerrm;
            INSERT INTO errores_insersiones 
            VALUES (seq_error.NEXTVAL, v_msj, v_msj_err); 
    END;
END;
/
---------------------------------------------
--SP Para docs

CREATE OR REPLACE PROCEDURE sp_ins_docs(p_folio NUMBER, p_rut VARCHAR)
IS
  v_bfile_t BFILE;
  v_bfile_c BFILE;
  v_bfile_p BFILE;
  v_doc_titulo VARCHAR2(45);
  v_doc_carga VARCHAR2(45);
  v_doc_porig VARCHAR2(45);
  v_msj     VARCHAR2(200);
  v_msj_err VARCHAR2(200);
BEGIN
    INSERT INTO anexo VALUES(p_folio, null, null, null, null, null, null);
    BEGIN
        v_doc_titulo := p_rut || '_titulo.docx'; 
        v_bfile_t := bfilename('OBJ_DOC',v_doc_titulo);
        UPDATE anexo SET DOC_TITULO = v_bfile_t WHERE ficha_nro_folio = p_folio; 
        UPDATE anexo SET FECH_DOCTITULO = SYSDATE WHERE ficha_nro_folio = p_folio;
    EXCEPTION
        WHEN OTHERS THEN
            v_msj := 'ERROR AL INTENTAR INSERTAR ANEXO DE TITULO AL FOLIO ' || p_folio || 'DEL POSTULANTE ' || p_rut;
            v_msj_err := sqlerrm;
            INSERT INTO errores_insersiones 
            VALUES (seq_error.NEXTVAL, v_msj, v_msj_err);  
    END;    
    ----------------------------------------------------------------------------
    BEGIN
        v_doc_carga := p_rut || '_cargas.docx';
        v_bfile_c := bfilename('OBJ_DOC',v_doc_carga);
        UPDATE anexo SET DOC_CARGAS = v_bfile_c WHERE ficha_nro_folio = p_folio;
        UPDATE anexo SET FECH_DOCCARGAS = SYSDATE WHERE ficha_nro_folio = p_folio;
    EXCEPTION
        WHEN OTHERS THEN
            v_msj := 'ERROR AL INTENTAR INSERTAR ANEXO DE CARGAS AL FOLIO ' || p_folio || 'DEL POSTULANTE ' || p_rut;
            v_msj_err := sqlerrm;
            INSERT INTO errores_insersiones 
            VALUES (seq_error.NEXTVAL, v_msj, v_msj_err);  
    END;     
    ---------------------------------------------------------------------------
    BEGIN
        v_doc_porig := p_rut || '_porign.docx';
        v_bfile_p := bfilename('OBJ_DOC',v_doc_porig);
        UPDATE anexo SET DOC_CARGAS = v_bfile_p WHERE ficha_nro_folio = p_folio;
        UPDATE anexo SET FECH_DOCPORI = SYSDATE WHERE ficha_nro_folio = p_folio;
    EXCEPTION
        WHEN OTHERS THEN
            v_msj := 'ERROR AL INTENTAR INSERTAR ANEXO DE PUEBLO ORIGINARIO AL FOLIO ' || p_folio || 'DEL POSTULANTE ' || p_rut;
            v_msj_err := sqlerrm;
            INSERT INTO errores_insersiones 
            VALUES (seq_error.NEXTVAL, v_msj, v_msj_err);  
    END;        
END;
/
--Proceso
-----------------------------------
DECLARE
    CURSOR cur_post IS SELECT * FROM POSTULANTE;
    CURSOR cur_ficha IS SELECT f.NRO_FOLIO AS FOLIO, p.rut_p AS RUT FROM FICHA f 
                          JOIN POSTULACION po ON po.ficha_nro_folio = f.nro_folio
                          JOIN POSTULANTE p ON po.postulante_rut_p = p.rut_p ORDER BY FOLIO;
BEGIN
    FOR pos IN cur_post
    LOOP
        sp_ins_fotos(pos.rut_p);
    END LOOP;
    FOR f IN cur_ficha
    LOOP
        sp_ins_docs(f.FOLIO, f.RUT);
    END LOOP;
END;
/

COMMIT;
