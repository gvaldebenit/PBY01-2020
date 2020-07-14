--BLOQUES PL/SQL 

--SECUENCIA ERRORES
DROP SEQUENCE seq_error_puntaje;
CREATE SEQUENCE seq_error_puntaje;

/*Paquete Contenedor de Todas las Funciones/Procedimientos.
No se especifica sobre si los bloques PL/SQL deben encontrarse adentro o afuera obligatoriamente,
asi que por simplicidad de modelado se dejará todo dentro */

--Paquete
CREATE OR REPLACE PACKAGE pkg_subsidio
IS
    v_valor_uf CONSTANT NUMBER := 28600;
    PROCEDURE sp_errores_puntaje(p_submodulo VARCHAR, p_msj_err VARCHAR);
    FUNCTION fn_carga(p_rut VARCHAR) RETURN NUMBER;
    FUNCTION fn_est_civil(p_rut VARCHAR) RETURN VARCHAR;
    FUNCTION fn_ahorro(p_rut VARCHAR) RETURN NUMBER;
    FUNCTION fn_vivienda(p_rut VARCHAR) RETURN NUMBER;
    FUNCTION fn_ptj_carga(p_rut VARCHAR, p_carga NUMBER) RETURN NUMBER;
    FUNCTION fn_ptj_ahorro(p_rut VARCHAR, p_ahorro NUMBER) RETURN NUMBER;
    FUNCTION fn_ptj_edad(p_rut VARCHAR) RETURN NUMBER;
    FUNCTION fn_ptj_titulo(p_rut VARCHAR) RETURN NUMBER;
    FUNCTION fn_ptj_extra(p_rut VARCHAR, p_viv NUMBER) RETURN NUMBER;
    FUNCTION fn_valor_vivienda(p_valor NUMBER) RETURN NUMBER;
    FUNCTION fn_ptj_ecivil(p_rut VARCHAR) RETURN NUMBER;
END;


-- PKG Body
CREATE OR REPLACE PACKAGE BODY pkg_subsidio
IS

--FUNCION CONTROLADORA DE EXCEPCIONES
    PROCEDURE sp_errores_puntaje(p_submodulo VARCHAR, p_msj_err VARCHAR)
    IS
    BEGIN
        INSERT INTO errores_proc_asig_puntaje VALUES(seq_error_puntaje.NEXTVAL, p_submodulo, p_msj_err);
    END;

--Funcion Obtener Cargas
    FUNCTION fn_carga(p_rut VARCHAR)
    RETURN NUMBER
    IS
        v_cargas NUMBER := 0;
        v_subproces VARCHAR(100);
        v_error_msj VARCHAR(200);
    BEGIN
        SELECT COUNT(rut_c)
          INTO v_cargas
          FROM carga c
         WHERE c.postulante_rut_p = p_rut;
        RETURN v_cargas;
    EXCEPTION
        WHEN OTHERS THEN
            v_subproces := 'Error Funcion Calculo Cargas RUT ' || p_rut;
            v_error_msj := sqlerrm;
            sp_errores_puntaje(v_subproces, v_error_msj);
            RETURN 0;
    END;

--Funcion Obtener Estado Civil
    FUNCTION fn_est_civil(p_rut VARCHAR)
    RETURN VARCHAR
    IS
        v_desc est_civil.descr%TYPE;
        v_subproces VARCHAR(100);
        v_error_msj VARCHAR(200);
    BEGIN
        SELECT e.descr
          INTO v_desc
          FROM postulante p
          JOIN est_civil e ON e.id_estc = p.est_civil_id_estc
         WHERE p.rut_p = p_rut;
        RETURN v_desc;
    EXCEPTION
        WHEN OTHERS THEN
            v_subproces := 'Error Funcion Obtener ESTADO CIVIL RUT ' || p_rut;
            v_error_msj := sqlerrm;
            sp_errores_puntaje(v_subproces, v_error_msj);
            RETURN '';
    END;

--Funcion Obtener Monto Ahorro
    FUNCTION fn_ahorro(p_rut VARCHAR)
    RETURN NUMBER
    IS
        v_monto NUMBER := 0;
        v_puntaje NUMBER := 0;
        v_subproces VARCHAR(100);
        v_error_msj VARCHAR(200);
    BEGIN
        SELECT a.monto 
          INTO v_monto
          FROM ahorro a
          JOIN ficha f ON f.ahorro_id_a = a.id_a
          JOIN POSTULACION po ON po.ficha_nro_folio = f.nro_folio
          JOIN postulante p ON p.rut_p = po.postulante_rut_p
         WHERE p.rut_p = p_rut;
        RETURN v_monto;   
    EXCEPTION
        WHEN OTHERS THEN
            v_subproces := 'Error Funcion Obtener Ahorro RUT ' || p_rut;
            v_error_msj := sqlerrm;
            sp_errores_puntaje(v_subproces, v_error_msj);
            RETURN 0;
    END;
    
    --Funcion obtener nro_vivienda
    FUNCTION fn_vivienda(p_rut VARCHAR) 
    RETURN NUMBER
    IS
        v_vivienda NUMBER := 0;
        v_subproces VARCHAR(100);
        v_error_msj VARCHAR(200);
    BEGIN
        SELECT v.id_viv
          INTO v_vivienda
          FROM vivienda v
          JOIN ficha f ON f.vivienda_id_viv = v.id_viv
          JOIN POSTULACION po ON po.ficha_nro_folio = f.nro_folio
          JOIN postulante p ON p.rut_p = po.postulante_rut_p
         WHERE p.rut_p = p_rut;
        RETURN v_vivienda;   
    EXCEPTION
        WHEN OTHERS THEN
            v_subproces := 'Error Funcion Obtener VIVIENDA RUT ' || p_rut;
            v_error_msj := sqlerrm;
            sp_errores_puntaje(v_subproces, v_error_msj);
            RETURN 0;
    END;

-- Funcion Puntaje por Cargas
    FUNCTION fn_ptj_carga(p_rut VARCHAR, p_carga NUMBER)
    RETURN NUMBER
    IS
        v_ptj NUMBER:= 0;
        v_subproces VARCHAR(100);
        v_error_msj VARCHAR(200);
    BEGIN  
         v_ptj :=
                CASE
                    WHEN p_carga < 2 THEN 50
                    WHEN p_carga BETWEEN 2 AND 4 THEN 100
                    WHEN p_carga > 4 THEN 200
                    END;
        RETURN v_ptj;
    EXCEPTION
        WHEN OTHERS THEN
            v_subproces := 'Error Funcion Obtener PUNTAJE POR CARGAS RUT ' || p_rut;
            v_error_msj := sqlerrm;
            sp_errores_puntaje(v_subproces, v_error_msj);
            RETURN 0;
    END;

--Funcion Puntaje por Ahorro
    FUNCTION fn_ptj_ahorro(p_rut VARCHAR, p_ahorro NUMBER)
    RETURN NUMBER
    IS
        v_puntaje NUMBER := 0;
        v_subproces VARCHAR(100);
        v_error_msj VARCHAR(200);
    BEGIN
        SELECT t.puntaje 
          INTO v_puntaje
          FROM tramo_pje_ahorro t
         WHERE p_ahorro BETWEEN ahorro_min AND ahorro_max;
        RETURN v_puntaje;
    EXCEPTION
        WHEN OTHERS THEN
            v_subproces := 'Error Funcion Obtener PUNTAJE POR AHORROS RUT ' || p_rut;
            v_error_msj := sqlerrm;
            sp_errores_puntaje(v_subproces, v_error_msj);
            RETURN 0;
    END;

--Funcion Puntaje por Edad
    FUNCTION fn_ptj_edad(p_rut VARCHAR)
    RETURN NUMBER
    IS
        v_puntaje NUMBER := 0;
        v_edad    NUMBER := 0;
        v_sql  VARCHAR(200);
        v_subproces VARCHAR(100);
        v_error_msj VARCHAR(200);
    BEGIN
        v_sql := 
       'SELECT TO_NUMBER(EXTRACT (YEAR FROM SYSDATE) - EXTRACT(YEAR FROM fechanac)) FROM postulante WHERE rut_p = :rut';
        execute immediate v_sql into v_edad using p_rut;  
       -----------------------  
        SELECT t.puntos 
          INTO v_puntaje
          FROM tramo_pje_edad t
         WHERE v_edad BETWEEN edad_min AND edad_max;
        RETURN v_puntaje;
    EXCEPTION
        WHEN OTHERS THEN
            v_subproces := 'Error Funcion Obtener PUNTAJE POR EDAD RUT ' || p_rut;
            v_error_msj := sqlerrm;
            sp_errores_puntaje(v_subproces, v_error_msj);
            RETURN 0;
    END;
    
    --Funcion Puntaje por TITULO
    FUNCTION fn_ptj_titulo(p_rut VARCHAR) 
    RETURN NUMBER
    IS
        v_puntaje NUMBER := 0;
        v_id_tit  NUMBER := 0;
        v_subproces VARCHAR(100);
        v_error_msj VARCHAR(200);
    BEGIN
        SELECT nvl_educ_id_educ 
          INTO v_id_tit
          FROM postulante
         WHERE rut_p = p_rut;
        IF v_id_tit = 5 THEN
            v_puntaje := 100;
        ELSIF v_id_tit IN (7,9) THEN
            v_puntaje := 200;
        ELSE
            v_puntaje := 0;
        END IF;    
        RETURN v_puntaje;
    EXCEPTION
        WHEN OTHERS THEN
            v_subproces := 'Error Funcion Obtener PUNTAJE POR TITULO RUT ' || p_rut;
            v_error_msj := sqlerrm;
            sp_errores_puntaje(v_subproces, v_error_msj);
            RETURN 0;
    END;
    
    --Funcion para puntaje EXTRA
     FUNCTION fn_ptj_extra(p_rut VARCHAR, p_viv NUMBER) 
     RETURN NUMBER
     IS
        v_puntaje NUMBER := 0;
        v_id_reg  NUMBER := 0;
        v_subproces VARCHAR(100);
        v_error_msj VARCHAR(200);
    BEGIN
        SELECT r.cod_reg
          INTO v_id_reg
          FROM vivienda v
          JOIN comuna co ON v.comuna_cod_com = co.cod_com
          JOIN region r ON co.region_cod_reg = r.cod_reg
         WHERE v.id_viv = p_viv;
        IF v_id_reg = 10 THEN
            v_puntaje := 0.3;
        ELSIF v_id_reg = 110 THEN
            v_puntaje := 1;
        ELSIF v_id_reg = 120 THEN
            v_puntaje := 1.3;
        ELSIF v_id_reg = 150 THEN
            v_puntaje := 0.5;
        ELSE
            v_puntaje := 0;
        END IF;    
        RETURN v_puntaje;
    EXCEPTION
        WHEN OTHERS THEN
            v_subproces := 'Error Funcion Obtener PUNTAJE POR REGION EXTREMA RUT ' || p_rut;
            v_error_msj := sqlerrm;
            sp_errores_puntaje(v_subproces, v_error_msj);
            RETURN 0;
    END; 
    
    --Funcion para calcular valor Vivienda
    FUNCTION fn_valor_vivienda(p_valor NUMBER) 
    RETURN NUMBER
    IS
        v_total NUMBER := 0;
        v_subproces VARCHAR(100);
        v_error_msj VARCHAR(200);
    BEGIN
        v_total := ROUND(pkg_subsidio.v_valor_uf * p_valor);
        RETURN v_total;
    EXCEPTION
        WHEN OTHERS THEN
            v_subproces := 'Error Funcion Obtener TOTAL VIVIENDA ';
            v_error_msj := sqlerrm;
            sp_errores_puntaje(v_subproces, v_error_msj);
            RETURN 0;
    END;        

    --Funcion para puntaje estado Civil
    FUNCTION fn_ptj_ecivil(p_rut VARCHAR) 
    RETURN NUMBER
    IS
        v_puntaje NUMBER := 0;
        v_id_eciv  NUMBER := 0;
        v_subproces VARCHAR(100);
        v_error_msj VARCHAR(200);
    BEGIN
        SELECT est_civil_id_estc
          INTO v_id_eciv
          FROM postulante
         WHERE rut_p = p_rut;
        SELECT puntaje
          INTO v_puntaje
          FROM tramo_pje_ecivil
         WHERE v_id_eciv = id_ecivil; 
        RETURN v_puntaje;
    EXCEPTION
        WHEN OTHERS THEN
            v_subproces := 'Error Funcion Obtener PUNTAJE POR ESTADO CIVIL RUT ' || p_rut;
            v_error_msj := sqlerrm;
            sp_errores_puntaje(v_subproces, v_error_msj);
            RETURN 0;
    END; 
        
END;

/
--PROCESO PRINCIPAL
CREATE OR REPLACE PROCEDURE sp_calcular_total
IS
    v_sql VARCHAR(200);
    v_pje_edad NUMBER := 0;
    v_pje_ecivil NUMBER := 0;
    v_pje_titulo NUMBER := 0;
    v_pje_ahorro NUMBER := 0;
    v_pje_indigena NUMBER := 0;
    v_pje_carga NUMBER := 0;
    v_pje_addicion NUMBER := 0;
    v_subproces VARCHAR(100);
    v_error_msj VARCHAR(200);
    CURSOR cur_post IS (SELECT * FROM postulante);
BEGIN
    v_sql := 'TRUNCATE TABLE puntaje';
    EXECUTE IMMEDIATE v_sql;
    v_sql := 'CREATE TABLE puntaje_temp AS SELECT * FROM puntaje';
    EXECUTE IMMEDIATE v_sql;
    FOR x IN cur_post
    LOOP
        BEGIN
            v_pje_edad := pkg_subsidio.fn_ptj_edad(x.rut_p);
            v_pje_ecivil := pkg_subsidio.fn_ptj_ecivil(x.rut_p);
            v_pje_titulo := pkg_subsidio.fn_ptj_titulo(x.rut_p);
            v_pje_ahorro := pkg_subsidio.fn_ptj_ahorro(x.rut_p, pkg_subsidio.fn_ahorro(x.rut_p));
            v_pje_indigena :=
                CASE
                    WHEN x.pueb_orig IS NULL THEN 0
                    ELSE 500
                END;    
            v_pje_carga := pkg_subsidio.fn_ptj_carga(x.rut_p, pkg_subsidio.fn_carga(x.rut_p));
            v_pje_addicion := pkg_subsidio.fn_ptj_extra(x.rut_p, pkg_subsidio.fn_vivienda(x.rut_p));
            INSERT INTO puntaje 
            VALUES(x.rut_p, v_pje_edad, v_pje_ecivil, v_pje_titulo, v_pje_ahorro, v_pje_indigena,v_pje_carga, v_pje_addicion, 0);
            v_sql := 'UPDATE puntaje SET pje_total = (SELECT pje_total FROM puntaje_temp WHERE postulante_rut_p = :1) WHERE postulante_rut_p =:2';
            EXECUTE IMMEDIATE v_sql USING x.rut_p, x.rut_p;
        EXCEPTION
            WHEN OTHERS THEN
                v_subproces := 'ERROR PROCESO CALCULO TOTAL RUT ' || x.rut_p;
                v_error_msj := sqlerrm;
                pkg_subsidio.sp_errores_puntaje(v_subproces, v_error_msj);
        END;        
    END LOOP;
    v_sql := 'DROP TABLE puntaje_temp';
    EXECUTE IMMEDIATE v_sql;
EXCEPTION
    WHEN OTHERS THEN
            v_subproces := 'ERROR PROCESO CALCULO';
            v_error_msj := sqlerrm;
            sp_errores_puntaje(v_subproces, v_error_msj);
END;


/

--TRIGGER 
CREATE OR REPLACE TRIGGER trg_calculo_total
AFTER INSERT ON puntaje
FOR EACH ROW
DECLARE
    v_total NUMBER := 0; 
    v_sql VARCHAR(500);
BEGIN
    v_total := (:new.pje_edad + :new.pje_ecivil + :new.pje_titulo + :new.pje_ahorro + 
               :new.pje_pindigena + :new.pje_carga);
    v_total := ROUND(v_total + (v_total * :new.pje_adicional));
    INSERT INTO puntaje_temp VALUES (:new.postulante_rut_p, :new.pje_edad, :new.pje_ecivil, :new.pje_titulo, :new.pje_ahorro, 
               :new.pje_pindigena, :new.pje_carga, :new.pje_adicional, v_total);         
END;

