CREATE VIEW boksOsoba AS 
SELECT * FROM zatrudniony 
LEFT JOIN boksy ON zatrudniony.[ID zatrudnionego] = boksy.[ID boksu]

