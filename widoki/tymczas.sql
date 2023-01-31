CREATE VIEW tymczas
AS
SELECT * FROM szczegolyZwierzaka
LEFT JOIN [Statusy Zwierzat] ON [Statusy Zwierzat].[ID Zwierzaka] = szczegolyZwierzaka.[ID Zwierzaka]
WHERE [Statusy Zwierzat].[ID statusu] = 2 OR [Statusy Zwierzat].[ID Zwierzaka] = 7

