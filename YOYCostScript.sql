SELECT
	KR2.Campaign
	,SUM(CAST(KR2.Cst2017 as float)/1000000) as Cost2017
	,Sum(CAST(KR2.Cst2018 as float)/1000000) as Cost2018
FROM
	 (
		SELECT
			KR.campaign
			,CASE When EXTRACT(year from KR.day) = '2017' Then KR.cost END as Cst2017
			,CASE When EXTRACT(year from KR.day) = '2018' Then KR.cost END as Cst2018
		FROM
			public.adwords_keywordreport KR
		WHERE
			KR.Day between DATE_TRUNC('month',getdate()) - INTERVAL '1 month' and DATE_TRUNC('month',getdate()) - INTERVAL '1 day'
			OR KR.Day between DATE_TRUNC('month',getdate()) - INTERVAL '1 month' - INTERVAL '1 year' and DATE_TRUNC('month',getdate()) - INTERVAL '1 day' - INTERVAL '1 year'
	) KR2
	
Group BY
	KR2.Campaign
Order BY
	KR2.Campaign