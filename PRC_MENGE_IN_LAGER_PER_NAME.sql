ALTER PROCEDURE MENGE_IN_LAGER_PER_PRODUKT_NAME
@PARAM_PRODUKT_NAME VARCHAR(255)
AS
BEGIN
	SELECT * FROM PRODUKTE WHERE PRODUKTDETAIL LIKE '%'+@PARAM_PRODUKT_NAME+'%';

END

