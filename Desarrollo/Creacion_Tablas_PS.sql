-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-07-12 21:20:25 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE ahorro CASCADE CONSTRAINTS;

DROP TABLE anexo CASCADE CONSTRAINTS;

DROP TABLE banco CASCADE CONSTRAINTS;

DROP TABLE carga CASCADE CONSTRAINTS;

DROP TABLE comuna CASCADE CONSTRAINTS;

DROP TABLE conyuge CASCADE CONSTRAINTS;

DROP TABLE deposito CASCADE CONSTRAINTS;

DROP TABLE domicilio CASCADE CONSTRAINTS;

DROP TABLE est_civil CASCADE CONSTRAINTS;

DROP TABLE evaluador CASCADE CONSTRAINTS;

DROP TABLE ficha CASCADE CONSTRAINTS;

DROP TABLE inf_tecnico CASCADE CONSTRAINTS;

DROP TABLE nvl_educ CASCADE CONSTRAINTS;

DROP TABLE par_evaluador CASCADE CONSTRAINTS;

DROP TABLE parentezco CASCADE CONSTRAINTS;

DROP TABLE postulacion CASCADE CONSTRAINTS;

DROP TABLE postulante CASCADE CONSTRAINTS;

DROP TABLE propietario CASCADE CONSTRAINTS;

DROP TABLE puntaje CASCADE CONSTRAINTS;

DROP TABLE region CASCADE CONSTRAINTS;

DROP TABLE tramo_pje_ahorro CASCADE CONSTRAINTS;

DROP TABLE tramo_pje_ecivil CASCADE CONSTRAINTS;

DROP TABLE tramo_pje_edad CASCADE CONSTRAINTS;

DROP TABLE tramo_viv CASCADE CONSTRAINTS;

DROP TABLE vivienda CASCADE CONSTRAINTS;

DROP TABLE errores_insersiones CASCADE CONSTRAINTS;

DROP TABLE errores_proc_asig_puntaje CASCADE CONSTRAINTS;

CREATE TABLE ahorro (
    id_a         NUMBER NOT NULL,
    nro_cuenta   VARCHAR2(30 CHAR) NOT NULL,
    rut_titular  VARCHAR2(10 CHAR) NOT NULL,
    rel_post     VARCHAR2(20 CHAR) NOT NULL,
    tipocuenta   VARCHAR2(20 CHAR) NOT NULL,
    monto        NUMBER NOT NULL,
    banco_id_b   NUMBER NOT NULL
);

ALTER TABLE ahorro ADD CONSTRAINT ahorro_pk PRIMARY KEY ( id_a );

CREATE TABLE anexo (
    ficha_nro_folio  NUMBER NOT NULL,
    doc_cargas       BFILE,
    fech_doccargas   DATE,
    doc_poriginario  BFILE,
    fech_docpori     DATE,
    doc_titulo       BFILE,
    fech_doctitulo   DATE
);

ALTER TABLE anexo ADD CONSTRAINT anexo_pk PRIMARY KEY ( ficha_nro_folio );

CREATE TABLE banco (
    id_b    NUMBER NOT NULL,
    nombre  VARCHAR2(40 CHAR) NOT NULL
);

ALTER TABLE banco ADD CONSTRAINT banco_pk PRIMARY KEY ( id_b );

CREATE TABLE carga (
    rut_c              VARCHAR2(10 CHAR) NOT NULL,
    nombre             VARCHAR2(50 CHAR) NOT NULL,
    apaterno           VARCHAR2(20 CHAR) NOT NULL,
    amaterno           VARCHAR2(20 CHAR) NOT NULL,
    postulante_rut_p   VARCHAR2(10 CHAR) NOT NULL,
    parentezco_id_par  NUMBER NOT NULL
);

ALTER TABLE carga ADD CONSTRAINT carga_pk PRIMARY KEY ( rut_c );

CREATE TABLE comuna (
    cod_com         NUMBER NOT NULL,
    nombre          VARCHAR2(50 CHAR) NOT NULL,
    region_cod_reg  NUMBER NOT NULL
);

ALTER TABLE comuna ADD CONSTRAINT comuna_pk PRIMARY KEY ( cod_com );

CREATE TABLE conyuge (
    rut_co            VARCHAR2(10 CHAR) NOT NULL,
    nombres           VARCHAR2(50 CHAR) NOT NULL,
    apaterno          VARCHAR2(20 CHAR) NOT NULL,
    amaterno          VARCHAR2(20 CHAR) NOT NULL,
    nacionalidad      VARCHAR2(20 CHAR) NOT NULL,
    fecha_nac         DATE NOT NULL,
    postulante_rut_p  VARCHAR2(10 CHAR) NOT NULL
);

CREATE UNIQUE INDEX conyuge__idx ON
    conyuge (
        postulante_rut_p
    ASC );

ALTER TABLE conyuge ADD CONSTRAINT conyuge_pk PRIMARY KEY ( rut_co );

CREATE TABLE deposito (
    nro_dep       NUMBER NOT NULL,
    ahorro_id_a   NUMBER NOT NULL,
    monto         NUMBER NOT NULL,
    fecha_dep     DATE NOT NULL,
    sucursal_dep  VARCHAR2(30 CHAR) NOT NULL
);

ALTER TABLE deposito ADD CONSTRAINT deposito_pk PRIMARY KEY ( nro_dep,
                                                              ahorro_id_a );

CREATE TABLE domicilio (
    id_dom            NUMBER NOT NULL,
    postulante_rut_p  VARCHAR2(10 CHAR) NOT NULL,
    calle             VARCHAR2(20 CHAR) NOT NULL,
    nro               VARCHAR2(10 CHAR) NOT NULL,
    block             VARCHAR2(5 CHAR),
    dpto              VARCHAR2(5 CHAR),
    manzana           VARCHAR2(10 CHAR),
    sitio             VARCHAR2(20 CHAR),
    localidad         VARCHAR2(20 CHAR),
    poblacion         VARCHAR2(20 CHAR),
    zipcode           NUMBER NOT NULL,
    comuna_cod_com    NUMBER NOT NULL
);

COMMENT ON COLUMN domicilio.id_dom IS
    'SEQ
';

CREATE UNIQUE INDEX domicilio__idx ON
    domicilio (
        postulante_rut_p
    ASC );

ALTER TABLE domicilio ADD CONSTRAINT domicilio_pk PRIMARY KEY ( id_dom );

CREATE TABLE est_civil (
    id_estc  NUMBER NOT NULL,
    descr   VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE est_civil ADD CONSTRAINT est_civil_pk PRIMARY KEY ( id_estc );

CREATE TABLE evaluador (
    rut         VARCHAR2(20 CHAR) NOT NULL,
    nombre      VARCHAR2(100 CHAR) NOT NULL,
    telefono    NUMBER NOT NULL,
    email       VARCHAR2(30 CHAR) NOT NULL,
    rol         VARCHAR2(20 CHAR) NOT NULL,
    categoria   VARCHAR2(20 CHAR) NOT NULL,
    resolucion  VARCHAR2(20 CHAR) NOT NULL,
    fec_resol   DATE NOT NULL
);

ALTER TABLE evaluador ADD CONSTRAINT evaluador_pk PRIMARY KEY ( rut );

CREATE TABLE ficha (
    nro_folio           NUMBER NOT NULL,
    fecha_sol           DATE NOT NULL,
    nom_rec             NVARCHAR2(100) NOT NULL,
    tramo_viv_id_tramo  NUMBER NOT NULL,
    valor_viv           NUMBER NOT NULL,
    comuna_cod_com      NUMBER NOT NULL,
    vivienda_id_viv     NUMBER NOT NULL,
    ahorro_id_a         NUMBER NOT NULL,
    cargas_ac           CHAR(1) NOT NULL,
    poriginario_ac      CHAR(1) NOT NULL,
    titulo_ac           CHAR(1) NOT NULL
);

CREATE UNIQUE INDEX ficha__idx ON
    ficha (
        ahorro_id_a
    ASC );

ALTER TABLE ficha ADD CONSTRAINT ficha_pk PRIMARY KEY ( nro_folio );

CREATE TABLE inf_tecnico (
    doc              NUMBER NOT NULL,
    estado           VARCHAR2(30 CHAR) NOT NULL,
    anom_irrep       NUMBER NOT NULL,
    anom_rep         NUMBER NOT NULL,
    apta_hab         CHAR(1) NOT NULL,
    apta_sub         CHAR(1) NOT NULL,
    vivienda_id_viv  NUMBER NOT NULL
);

CREATE UNIQUE INDEX inf_tecnico__idx ON
    inf_tecnico (
        vivienda_id_viv
    ASC );

ALTER TABLE inf_tecnico ADD CONSTRAINT inf_tecnico_pk PRIMARY KEY ( doc );

CREATE TABLE nvl_educ (
    id_educ  NUMBER NOT NULL,
    descr   VARCHAR2(40 CHAR) NOT NULL
);

ALTER TABLE nvl_educ ADD CONSTRAINT nvl_educ_pk PRIMARY KEY ( id_educ );

CREATE TABLE par_evaluador (
    evaluador_rut    VARCHAR2(20 CHAR) NOT NULL,
    inf_tecnico_doc  NUMBER NOT NULL
);

ALTER TABLE par_evaluador ADD CONSTRAINT par_evaluador_pk PRIMARY KEY ( evaluador_rut,
                                                                        inf_tecnico_doc );

CREATE TABLE parentezco (
    id_par  NUMBER NOT NULL,
    descr  VARCHAR2(40 CHAR) NOT NULL
);

ALTER TABLE parentezco ADD CONSTRAINT parentezco_pk PRIMARY KEY ( id_par );

CREATE TABLE postulacion (
    postulante_rut_p  VARCHAR2(10 CHAR) NOT NULL,
    ficha_nro_folio   NUMBER NOT NULL
);

ALTER TABLE postulacion ADD CONSTRAINT postulacion_pk PRIMARY KEY ( postulante_rut_p,
                                                                    ficha_nro_folio );

CREATE TABLE postulante (
    rut_p              VARCHAR2(10 CHAR) NOT NULL,
    nombres            VARCHAR2(50 CHAR) NOT NULL,
    apaterno           VARCHAR2(20 CHAR) NOT NULL,
    amaterno           VARCHAR2(20 CHAR) NOT NULL,
    fechanac           DATE NOT NULL,
    nacionalidad       VARCHAR2(20 CHAR) NOT NULL,
	pueb_orig          VARCHAR2(30 CHAR),
    est_civil_id_estc  NUMBER NOT NULL,
    nvl_educ_id_educ   NUMBER NOT NULL,
    titulo_prof        VARCHAR2(50 CHAR),
    inst_estudio       VARCHAR2(30 CHAR) NOT NULL,
    separado           CHAR(1) NOT NULL,
    residencia         CHAR(1),
    fech_residencia    DATE,
    cara               BLOB NOT NULL,
    firma              BLOB NOT NULL,
    fono_trab          VARCHAR2(12 CHAR) NOT NULL,
    fono_dom           VARCHAR2(12 CHAR) NOT NULL,
    mail               VARCHAR2(30 CHAR) NOT NULL,
    fono_movil         VARCHAR2(12 CHAR) NOT NULL
);

ALTER TABLE postulante ADD CONSTRAINT postulante_pk PRIMARY KEY ( rut_p );

CREATE TABLE propietario (
    rut_prop  VARCHAR2(10 CHAR) NOT NULL,
    nombre    VARCHAR2(100 CHAR) NOT NULL,
    telefono  VARCHAR2(12 CHAR) NOT NULL,
    mail      VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE propietario ADD CONSTRAINT propietario_pk PRIMARY KEY ( rut_prop );

CREATE TABLE puntaje (
    postulante_rut_p  VARCHAR2(10 CHAR) NOT NULL,
    pje_edad          NUMBER NOT NULL,
    pje_ecivil        NUMBER NOT NULL,
    pje_titulo        NUMBER NOT NULL,
    pje_ahorro        NUMBER NOT NULL,
    pje_pindigena     NUMBER NOT NULL,
    pje_carga         NUMBER NOT NULL,
	pje_adicional     NUMBER NOT NULL,
    pje_total         NUMBER NOT NULL
    
);

ALTER TABLE puntaje ADD CONSTRAINT puntaje_pk PRIMARY KEY ( postulante_rut_p );

CREATE TABLE region (
    cod_reg  NUMBER NOT NULL,
    nombre   VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( cod_reg );

CREATE TABLE tramo_pje_ahorro (
    id          NUMBER NOT NULL,
    ahorro_min  NUMBER NOT NULL,
    ahorro_max  NUMBER NOT NULL,
    puntaje     NUMBER NOT NULL
);

ALTER TABLE tramo_pje_ahorro ADD CONSTRAINT tramo_pje_ahorro_pk PRIMARY KEY ( id );

CREATE TABLE tramo_pje_ecivil (
    id_pje     NUMBER NOT NULL,
    id_ecivil  NUMBER NOT NULL,
    puntaje    NUMBER NOT NULL
);

ALTER TABLE tramo_pje_ecivil ADD CONSTRAINT tramo_pje_ecivil_pk PRIMARY KEY ( id_pje );

CREATE TABLE tramo_pje_edad (
    id_edad   NUMBER NOT NULL,
    edad_min  NUMBER NOT NULL,
    edad_max  NUMBER NOT NULL,
    puntos    NUMBER NOT NULL
);

ALTER TABLE tramo_pje_edad ADD CONSTRAINT tramo_pje_edad_pk PRIMARY KEY ( id_edad );

CREATE TABLE tramo_viv (
    id_tramo   NUMBER NOT NULL,
    valor_min  NUMBER NOT NULL,
    valor_max  NUMBER NOT NULL
);

ALTER TABLE tramo_viv ADD CONSTRAINT tramo_viv_pk PRIMARY KEY ( id_tramo );

CREATE TABLE vivienda (
    id_viv                NUMBER NOT NULL,
    propietario_rut_prop  VARCHAR2(10 CHAR) NOT NULL,
	tipo_viv              VARCHAR2(30 CHAR) NOT NULL,
    direccion             VARCHAR2(50 CHAR) NOT NULL,
    nro_dpto              VARCHAR2(5 CHAR),
    nro_piso              NUMBER,
    rol_sii               VARCHAR2(20 CHAR) NOT NULL,
    poblacion             VARCHAR2(20 CHAR) NOT NULL,
    nro_permiso           VARCHAR2(50 CHAR) NOT NULL,
    fech_perm             DATE NOT NULL,
    m2                    NUMBER NOT NULL,
    ano_const             NUMBER NOT NULL,
    nro_rec               VARCHAR2(50 CHAR) NOT NULL,
    fecha_rec             DATE NOT NULL,
    comuna_cod_com        NUMBER NOT NULL
);

ALTER TABLE vivienda ADD CONSTRAINT vivienda_pk PRIMARY KEY ( id_viv );

ALTER TABLE ahorro
    ADD CONSTRAINT ahorro_banco_fk FOREIGN KEY ( banco_id_b )
        REFERENCES banco ( id_b );

ALTER TABLE anexo
    ADD CONSTRAINT anexo_ficha_fk FOREIGN KEY ( ficha_nro_folio )
        REFERENCES ficha ( nro_folio );

ALTER TABLE carga
    ADD CONSTRAINT carga_parentezco_fk FOREIGN KEY ( parentezco_id_par )
        REFERENCES parentezco ( id_par );

ALTER TABLE carga
    ADD CONSTRAINT carga_postulante_fk FOREIGN KEY ( postulante_rut_p )
        REFERENCES postulante ( rut_p );

ALTER TABLE comuna
    ADD CONSTRAINT comuna_region_fk FOREIGN KEY ( region_cod_reg )
        REFERENCES region ( cod_reg );

ALTER TABLE conyuge
    ADD CONSTRAINT conyuge_postulante_fk FOREIGN KEY ( postulante_rut_p )
        REFERENCES postulante ( rut_p );

ALTER TABLE deposito
    ADD CONSTRAINT deposito_ahorro_fk FOREIGN KEY ( ahorro_id_a )
        REFERENCES ahorro ( id_a );

ALTER TABLE domicilio
    ADD CONSTRAINT domicilio_comuna_fk FOREIGN KEY ( comuna_cod_com )
        REFERENCES comuna ( cod_com );

ALTER TABLE domicilio
    ADD CONSTRAINT domicilio_postulante_fk FOREIGN KEY ( postulante_rut_p )
        REFERENCES postulante ( rut_p );

ALTER TABLE ficha
    ADD CONSTRAINT ficha_ahorro_fk FOREIGN KEY ( ahorro_id_a )
        REFERENCES ahorro ( id_a );

ALTER TABLE ficha
    ADD CONSTRAINT ficha_comuna_fk FOREIGN KEY ( comuna_cod_com )
        REFERENCES comuna ( cod_com );

ALTER TABLE ficha
    ADD CONSTRAINT ficha_tramo_viv_fk FOREIGN KEY ( tramo_viv_id_tramo )
        REFERENCES tramo_viv ( id_tramo );

ALTER TABLE ficha
    ADD CONSTRAINT ficha_vivienda_fk FOREIGN KEY ( vivienda_id_viv )
        REFERENCES vivienda ( id_viv );

ALTER TABLE inf_tecnico
    ADD CONSTRAINT inf_tecnico_vivienda_fk FOREIGN KEY ( vivienda_id_viv )
        REFERENCES vivienda ( id_viv );

ALTER TABLE par_evaluador
    ADD CONSTRAINT par_evaluador_evaluador_fk FOREIGN KEY ( evaluador_rut )
        REFERENCES evaluador ( rut );

ALTER TABLE par_evaluador
    ADD CONSTRAINT par_evaluador_inf_tecnico_fk FOREIGN KEY ( inf_tecnico_doc )
        REFERENCES inf_tecnico ( doc );

ALTER TABLE postulacion
    ADD CONSTRAINT postulacion_ficha_fk FOREIGN KEY ( ficha_nro_folio )
        REFERENCES ficha ( nro_folio );

ALTER TABLE postulacion
    ADD CONSTRAINT postulacion_postulante_fk FOREIGN KEY ( postulante_rut_p )
        REFERENCES postulante ( rut_p );

ALTER TABLE postulante
    ADD CONSTRAINT postulante_est_civil_fk FOREIGN KEY ( est_civil_id_estc )
        REFERENCES est_civil ( id_estc );

ALTER TABLE postulante
    ADD CONSTRAINT postulante_nvl_educ_fk FOREIGN KEY ( nvl_educ_id_educ )
        REFERENCES nvl_educ ( id_educ );

ALTER TABLE puntaje
    ADD CONSTRAINT puntaje_postulante_fk FOREIGN KEY ( postulante_rut_p )
        REFERENCES postulante ( rut_p );

ALTER TABLE vivienda
    ADD CONSTRAINT vivienda_comuna_fk FOREIGN KEY ( comuna_cod_com )
        REFERENCES comuna ( cod_com );

ALTER TABLE vivienda
    ADD CONSTRAINT vivienda_propietario_fk FOREIGN KEY ( propietario_rut_prop )
        REFERENCES propietario ( rut_prop );

--TABLAS ERRORES
CREATE TABLE errores_insersiones(
    id NUMBER PRIMARY KEY,
    mensaje VARCHAR(200),
    err_msj VARCHAR(200)
);
	
CREATE TABLE errores_proc_asig_puntaje(
	id NUMBER PRIMARY KEY,
	subprograma VARCHAR(100),
	err_msj VARCHAR(200)
);




COMMIT;

-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            25
-- CREATE INDEX                             4
-- ALTER TABLE                             48
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
