--CREACIÓN VISTA 

CREATE OR REPLACE VIEW vista_favorecidos AS
    SELECT p.rut_p "RUT_POSTULANE",
           p.nombres || ' ' || p.apaterno || ' ' || p.amaterno "NOMBRE_POSTULANTE",
           EXTRACT(YEAR FROM SYSDATE) - EXTRACT( YEAR FROM p.fechanac) "EDAD",
           ptj.pje_edad "PUNTAJE_EDAD", 
           pkg_subsidio.fn_carga(p.rut_p) "CARGAS_FAMILIARES",
           ptj.pje_carga "PUNTAJE_CARGAS_FAMILIARES",
           pkg_subsidio.fn_est_civil(p.rut_p) "ESTADO_CIVIL",
           ptj.pje_ecivil "PUNTAJE_ESTADO_CIVIL",
           NVL(p.pueb_orig, 'NO') "PUEBLO_ORIG",
           ptj.pje_pindigena "PUNTAJE_PUEBLO_ORIG",
           pkg_subsidio.fn_ahorro(p.rut_p) "MONTO_AHORRO",
           ptj.pje_ahorro "PUNTAJE_MONTO_AHORRO",
           p.titulo_prof "TITULO",
           ptj.pje_titulo "PUNTAJE_TITULO",
           (CASE
                WHEN r.cod_reg IN (10, 110, 120, 150) THEN r.nombre
                ELSE 'NA'
            END) "REGION_EXTREMA", 
           ptj.pje_adicional "PUNTAJE_ZONA_EXTREMA",
           ptj.pje_total "PUNTAJE_TOTAL",
           v.tipo_viv "TIPO_VIVIENDA_SUBSIDIADA",
           pkg_subsidio.fn_valor_vivienda(f.valor_viv) "VALOR VIVIENDA",
           pkg_subsidio.fn_valor_vivienda(f.valor_viv)  - a.monto "MONTO_SUBSIDIO"
      FROM postulante p
      LEFT JOIN puntaje ptj ON p.rut_p = ptj.postulante_rut_p
      JOIN postulacion pos ON pos.postulante_rut_p = p.rut_p
      JOIN ficha f ON f.nro_folio = pos.ficha_nro_folio
      JOIN ahorro a ON a.id_a = f.ahorro_id_a
      JOIN vivienda v ON v.id_viv = f.vivienda_id_viv
      JOIN comuna com ON v.comuna_cod_com = com.cod_com
      JOIN region r ON r.cod_reg = com.region_cod_reg
     WHERE ptj.pje_total >= (SELECT AVG(pje_total) FROM puntaje)
      WITH READ ONLY; 
           
           
           
           
           
           
           
           
           
           
           
           
           
           