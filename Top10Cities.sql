/*Fun Notes! So i have figured out what table to join to get the locations translated. These can be found in
 * v_adwordsapilocationcriteria_20151013   There is also a view created that should do this connection for us
 * v_adwords_geoadgroupreport howver i am not seeing it having data more recent than 2016 so i wonder if something about
 * the view is no longer working properly. Probably because this is referancing the _old table*/


/*Current Year Impressions*/	
Select TOP 10
	TACO.City
	,TACO.TotImpressions
From
		(
		SELECT
			GGR.city
			,SUM(GGR.impressions) TotImpressions
		FROM
			public.v_adwords_geoadgroupreport GGR
		WHERE
			GGR.Day >= DATE_TRUNC('Year',getdate())
			and GGR.city <> ' --'
		Group By
			GGR.city
		) TACO
Order By
	Taco.TotImpressions DESC
	
/*Previous Year Impressions*/
Select TOP 10
	TACO.City
	,TACO.TotImpressions
From
		(
		SELECT
			GGR.city
			,SUM(GGR.impressions) TotImpressions
		FROM
			public.v_adwords_geoadgroupreport GGR
		WHERE
			GGR.Day between DATE_TRUNC('Year',getdate()) - interval '1 year' and DATE_TRUNC('Year',getdate())
			and GGR.city <> ' --'
		Group By
			GGR.city
		) TACO
Order By
	Taco.TotImpressions DESC
	
/*Current Year Clicks*/
Select TOP 10
	TACO.City
	,TACO.TotClicks
From
		(
		SELECT
			GGR.city
			,SUM(GGR.clicks) TotClicks
		FROM
			public.v_adwords_geoadgroupreport GGR
		WHERE
			GGR.Day >= DATE_TRUNC('Year',getdate())
			and GGR.city <> ' --'
		Group By
			GGR.city
		) TACO
Order By
	Taco.TotClicks DESC
/*Previous Year Clicks*/	
Select TOP 10
	TACO.City
	,TACO.TotClicks
From
		(
		SELECT
			GGR.city
			,SUM(GGR.clicks) TotClicks
		FROM
			public.v_adwords_geoadgroupreport GGR
		WHERE
			GGR.Day between DATE_TRUNC('Year',getdate()) - interval '1 year' and DATE_TRUNC('Year',getdate())
			and GGR.city <> ' --'
		Group By
			GGR.city
		) TACO
Order By
	Taco.TotClicks DESC
