SELECT TOP 25
	Burrito.searchterm
	,Burrito.Impressions
FROM (
		SELECT
			SPR.searchterm
			,SUM(SPR.impressions) as Impressions
		FROM 
			public.adwords_searchperformancereport SPR
		WHERE	
			SPR.date > DATE_TRUNC('YEAR',GETDATE())
		Group BY
			SPR.searchterm
	) Burrito
ORDER BY
	Burrito.Impressions DESC