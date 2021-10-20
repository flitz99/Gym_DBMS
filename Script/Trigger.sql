
/*limite di un abbonamento per abbonato*/

CREATE FUNCTION limite_abbonamenti() RETURNS trigger AS $limite_abbonamenti$
	BEGIN
		IF(SELECT COUNT(*)
		   FROM ABBONAMENTO AS ABBONAMENTI
		   	WHERE ABBONAMENTI.CF_Abbonato = NEW.CF_Abbonato)=2
		THEN
			RAISE EXCEPTION 'Questo abbonato ha già un abbonamento!';
		END IF;
	RETURN NEW;
	END;
$limite_abbonamenti$ LANGUAGE plpgsql;

CREATE TRIGGER LIMITE_ABBONAMENTI
AFTER INSERT OR UPDATE
ON ABBONAMENTO
FOR EACH ROW
EXECUTE PROCEDURE limite_abbonamenti();

/* limite di due telefoni per persona */

CREATE FUNCTION limite_telefoni() RETURNS trigger AS $limite_telefoni$
	BEGIN
		IF (SELECT count(*)
			FROM TELEFONO_PERSONA AS TEL
			WHERE TEL.CF = NEW.CF)=3
		THEN
		RAISE EXCEPTION 'Questa persona ha già due numeri di telefono registrati';
		END IF;
	RETURN NEW;
	END;
$limite_telefoni$ LANGUAGE plpgsql;

CREATE TRIGGER LIMITE_TELEFONI
AFTER INSERT OR UPDATE
ON TELEFONO_PERSONA
FOR EACH ROW
EXECUTE PROCEDURE limite_telefoni();


/* limite di un armadietto per abbonato*/

CREATE FUNCTION limite_armadietti() RETURNS trigger AS $limite_armadietti$
	BEGIN
		IF(SELECT COUNT(*)
		   FROM ARMADIETTO AS ARMADIETTI
		   	WHERE ARMADIETTI.CF_Abbonato = NEW.CF_Abbonato)=2
		THEN
			RAISE EXCEPTION 'Questo abbonato ha già un armadietto!';
		END IF;
	RETURN NEW;
	END;
$limite_armadietti$ LANGUAGE plpgsql;

CREATE TRIGGER LIMITE_ARMADIETTI
AFTER INSERT OR UPDATE
ON ARMADIETTO
FOR EACH ROW
EXECUTE PROCEDURE limite_armadietti();

/* limite di una tessera per abbonato */

CREATE FUNCTION limite_tessera() RETURNS trigger AS $limite_tessera$
	BEGIN
		IF(SELECT COUNT(*)
		   FROM TESSERA AS TESSERE
		   	WHERE TESSERE.CF_Abbonato = NEW.CF_Abbonato)=2
		THEN
			RAISE EXCEPTION 'Questo abbonato ha già una tessera associata!';
		END IF;
	RETURN NEW;
	END;
$limite_tessera$ LANGUAGE plpgsql;

CREATE TRIGGER LIMITE_TESSERA
AFTER INSERT OR UPDATE
ON TESSERA
FOR EACH ROW
EXECUTE PROCEDURE limite_tessera();

/* limite di una scheda per abbonato */

CREATE FUNCTION limite_scheda() RETURNS trigger AS $limite_scheda$
	BEGIN
		IF(SELECT COUNT(*)
		   FROM SCHEDA_ALLENAMENTO AS SCHEDE
		   	WHERE SCHEDE.CF_Abbonato = NEW.CF_Abbonato)=2
		THEN
			RAISE EXCEPTION 'Questo abbonato ha già una scheda di allenamento!';
		END IF;
	RETURN NEW;
	END;
$limite_scheda$ LANGUAGE plpgsql;

CREATE TRIGGER LIMITE_SCHEDA
AFTER INSERT OR UPDATE
ON SCHEDA_ALLENAMENTO
FOR EACH ROW
EXECUTE PROCEDURE limite_scheda();

/* limite di una visita per abbonato */

CREATE FUNCTION limite_visite() RETURNS trigger AS $limite_visite$
	BEGIN
		IF(SELECT COUNT(*)
		   FROM VISITA_MEDICA AS VISITE
		   	WHERE VISITE.CF_Abbonato = NEW.CF_Abbonato)=2
		THEN
			RAISE EXCEPTION 'Questo abbonato ha già una visita medica!';
		END IF;
	RETURN NEW;
	END;
$limite_visite$ LANGUAGE plpgsql;

CREATE TRIGGER LIMITE_VISITE
AFTER INSERT OR UPDATE
ON VISITA_MEDICA
FOR EACH ROW
EXECUTE PROCEDURE limite_visite();



