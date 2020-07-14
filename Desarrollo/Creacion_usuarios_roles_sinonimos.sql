--CREACION USUARIOS

CREATE USER subsidio IDENTIFIED BY subsidio;
GRANT ALL PRIVILEGES TO subsidio;

CREATE USER administrador IDENTIFIED BY administrador;
CREATE USER consultor IDENTIFIED BY consultor;

GRANT CONNECT, RESOURCE TO administrador;
GRANT CONNECT, RESOURCE TO consultor;

/*CREACION SINONIMOS
CREAR SINONIMOS PUBLICOS PARA TODOS LOS OBJETOS DE SUBSIDIO
USANDO UN CICLO FOR, basado en un ejemplo de internet */

BEGIN
    FOR t IN (SELECT object_name, object_type FROM all_objects 
               WHERE owner='subsidio' AND object_type IN ('TABLE','VIEW','PROCEDURE','FUNCTION','PACKAGE','SEQUENCE')) 
    LOOP
        EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM '|| t.object_name || ' for subsidio.'|| t.object_name;
    END LOOP;
END;

SELECT * FROM all_synonyms WHERE TABLE_OWNER = 'SUBSIDIO';

--ROLES Y PRIVILEGIOS

CREATE ROLE CONSULTA;
CREATE ROLE ADMINISTRA;

/* ASIGNAR PRIVILEGIOS. USANDO LO MISMO QUE USAMOS PARA LOS SINONIMOS */

-- Para Administra
BEGIN
    FOR t IN (SELECT object_name, object_type FROM all_objects 
               WHERE owner='SUBSIDIO' AND object_type IN ('TABLE','VIEW','PROCEDURE','FUNCTION','PACKAGE')) 
    LOOP
        IF t.object_type IN ('TABLE','VIEW') THEN
            EXECUTE IMMEDIATE 'GRANT SELECT, UPDATE, INSERT, DELETE ON SUBSIDIO.'||t.object_name||' TO ADMINISTRA';
        ELSIF t.object_type IN ('PROCEDURE','FUNCTION','PACKAGE') THEN
            EXECUTE IMMEDIATE 'GRANT EXECUTE ON SUBSIDIO.'||t.object_name||' TO ADMINISTRA';
        END IF;
    END LOOP;
END;
/

-- Para Consulta
BEGIN
    FOR t IN (SELECT object_name, object_type FROM all_objects 
               WHERE owner='SUBSIDIO' AND object_type IN ('TABLE','VIEW','PROCEDURE','FUNCTION','PACKAGE')) 
    LOOP
        IF t.object_type IN ('TABLE','VIEW') THEN
            EXECUTE IMMEDIATE 'GRANT SELECT ON SUBSIDIO.'||t.object_name||' TO CONSULTA';
        ELSIF t.object_type IN ('PROCEDURE','FUNCTION','PACKAGE') THEN
            EXECUTE IMMEDIATE 'GRANT EXECUTE ON SUBSIDIO.'||t.object_name||' TO CONSULTA';
        END IF;
    END LOOP;
END;

--OTORGAR ROLES A USUARIOS

GRANT ADMINISTRA TO administrador; 
GRANT CONSULTA TO consultor;
